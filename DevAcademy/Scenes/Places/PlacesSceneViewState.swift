//
//  PlacesSceneViewState.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import SwiftUI
struct SceneViewState: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObservableObject
    @State var showFavorites = false
    
    var features: [Feature] {
        placesObject.features
    }
    var dataNonEmpty: Bool {
        !features.isEmpty
    }
    func favoritesPressed() {
        showFavorites = true
    }
    func fetchPlaces() async {
        await placesObject.fetchPlaces()
    }
}
