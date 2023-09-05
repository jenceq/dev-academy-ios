//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
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
    init(placesService: PlacesService) {
        self.placesService = placesService
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
        features.append(contentsOf: rawPlaces)
        if let favPlaces = favouritePlaces {
            for id in favPlaces {
                if let idx = features.firstIndex(where: {$0.attributes.ogcFid == id}) {
                    let value = features.remove(at: idx)
                    features.insert(value, at: 0)
                }
            }
        }
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
}
