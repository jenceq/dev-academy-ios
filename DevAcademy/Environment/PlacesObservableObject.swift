//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
final class PlacesObservableObject: ObservableObject {
    @Published var features: [Feature] = []
    
    private let placesService: PlacesService
    init(placesService: PlacesService){
        self.placesService = placesService
    }
    @MainActor
    func fetchPlaces() async{
        do{
            let loadedPlaces = try await placesService.places()
            self.features = loadedPlaces.features
        } catch{
            print(error)
        }
    }
}
