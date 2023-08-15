//
//  Coordinator.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import SwiftUI

final class Coordinator: ObservableObject{
    var placesScene: some View{
        PlacesScene()
        
    }
    func PlacesDetailScene(with feature: Feature) -> some View{
        PlacesDetail(state: PlacesDetailStateView(feature: feature))
    }
    
    var FavoritesScene: some View{
        Text("Nic")
    }
}
