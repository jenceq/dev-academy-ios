//
//  PlacesDetailStateView.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import SwiftUI

struct PlacesDetailStateView: DynamicProperty{
    let feature: Feature
    
    init(feature: Feature){
        self.feature = feature
    }
    var ImageUrl: URL{
        feature.properties.obrId1
    }
    var placeTitle: String{
        feature.properties.nazev
    }
    var placeType: PossibleKind{
        feature.properties.druh
    }
    
}
