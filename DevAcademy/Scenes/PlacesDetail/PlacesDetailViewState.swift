//
//  PlacesDetailViewState.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import SwiftUI

struct PlacesDetailViewState: DynamicProperty {
    private let feature: Feature
    
    init(feature: Feature) {
        self.feature = feature
    }
    var imageUrl: URL? {
        feature.attributes.imageURL
    }
    var placeTitle: String {
        feature.attributes.name
    }
    var placeType: PossibleKind {
        feature.attributes.type
    }
    
}
