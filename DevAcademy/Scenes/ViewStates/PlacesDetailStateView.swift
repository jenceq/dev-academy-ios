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
    var ImageUrl: URL?{
        feature.attributes.imageURL
    }
    var placeTitle: String{
        feature.attributes.name
    }
    var placeType: PossibleKind{
        feature.attributes.type
    }
    
}
