//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import CoreLocation
final class PlacesObservableObject: ObservableObject {
    @Published var features: [Feature] = []
    var rawPlaces: [Feature] = [] {
        didSet {
            updatePlaces()
        }
    }
    
    private(set) var favouritePlaces: [Int]? {
        get { UserDefaults.standard.array(forKey: "favourites") as? [Int] }
        set {
            UserDefaults.standard.set(newValue, forKey: "favourites")
            updatePlaces()
        }
    }
    
    private let placesService: PlacesService
    private let userLocation: UserLocationService
    private var lastUpdatedLocation: CLLocation?
  
    init(placesService: PlacesService, userLocation: UserLocationService) {
        self.placesService = placesService
        self.userLocation = userLocation
        
        self.userLocation.listenDidUpdateLocation { [weak self] location in
            DispatchQueue.main.async {
                self?.locationDidUpdate(location: location)
            }
        }
        self.userLocation.listenDidUpdateStatus { [weak self] status in
            switch status {
            case .notDetermined:
                self?.userLocation.requestAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                self?.beginLocationUpdates()
            default: break
            }
        }
        
    }
    @MainActor
    func fetchPlaces() async {
        do {
            let loadedPlaces = try await placesService.places()
            self.rawPlaces = loadedPlaces.features
        } catch {
            print(error)
        }
    }
    func updatePlaces() {
        var regularPlaces = rawPlaces
        features.append(contentsOf: regularPlaces)
        if let lastUpdatedLocation {
            regularPlaces.sort { lPlace, rPlace in
                guard let rPoint = rPlace.geometry?.cllocation else {
                    return false
                }
                guard let lPoint = lPlace.geometry?.cllocation else {
                    return true
                }
                return lastUpdatedLocation.distance(from: lPoint).magnitude < lastUpdatedLocation.distance(from: rPoint).magnitude
            }
        }
        if let favPlaces = favouritePlaces {
            for id in favPlaces {
                if let idx = features.firstIndex(where: {$0.attributes.ogcFid == id}) {
                    let value = features.remove(at: idx)
                    features.insert(value, at: 0)
                }
            }
        }
    }
    func beginLocationUpdates() {
        self.userLocation.startUpdatingLocation()
    }
    
    func shouldUpdate(location: CLLocation) -> Bool {
        lastUpdatedLocation.flatMap { $0.distance(from:location).magnitude > 400 } ?? true
    
    }
    func setFavs(feature: Feature, favourite favStatus: Bool) {
        var favouritePlaces = self.favouritePlaces ?? []
        let currentIdx = favouritePlaces.firstIndex(of: feature.attributes.ogcFid)
        switch (favStatus, currentIdx) {
        case (true, nil):
            favouritePlaces.append(feature.attributes.ogcFid)
        case (false, let index?):
            favouritePlaces.remove(at: index)
        default:
            return
            
        }
        self.favouritePlaces = favouritePlaces
    }
    func locationDidUpdate(location: [CLLocation]) {
        guard let userLocation = location.first, shouldUpdate(location: userLocation) else { return }
        self.lastUpdatedLocation = userLocation
        updatePlaces()
    }
}
