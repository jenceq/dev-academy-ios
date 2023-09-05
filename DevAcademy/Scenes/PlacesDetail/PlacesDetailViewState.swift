//
//  PlacesDetailViewState.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
import SwiftUI

struct PlacesDetailViewState: DynamicProperty {
    @EnvironmentObject private var placesObject: PlacesObservableObject
   
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
    var isFavourite: Binding<Bool> {
        .init {
            placesObject.favouritePlaces?.contains(feature.attributes.ogcFid) ?? false
        } set: { newValue in
            placesObject.setFavs(feature: feature, favourite: newValue)
        }
    }

    
    
    
}
