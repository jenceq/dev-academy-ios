//
//  PlacesSceneStateView.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import SwiftUI
struct SceneStateView: DynamicProperty{
    @EnvironmentObject private var placesObject: PlacesObservableObject
    @State var showFavorites = false
    
    var features: [Feature]{
        placesObject.feature
    }
    var DataNonEmpty: Bool{
        !features.isEmpty
    }
    
    func FavoritesPressed(){
        showFavorites = true
    }
    func fetchPlaces() async{
        await placesObject.fetchPlaces()
    }
}
