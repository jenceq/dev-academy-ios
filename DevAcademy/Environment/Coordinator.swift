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
    func placesDetailScene(with feature: Feature) -> some View{
        PlacesDetail(state: PlacesDetailViewState(feature: feature))
    }
    
    var favoritesScene: some View{
        Text("Nic")
    }
}
