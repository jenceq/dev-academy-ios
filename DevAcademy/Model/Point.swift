//
//  Point.swift
//  DevAcademy
//
//  Created by To je jedno on 17.08.2023.
//

import Foundation
import CoreLocation
struct Point: Decodable {
    let latitude: Double
    let longitude: Double
    enum CodingKeys: String, CodingKey {
        case latitude = "x"
        case longitude = "y"
    }
}

extension Point {
    var cllocation: CLLocation {
        .init(latitude: latitude, longitude: longitude)
    }
}
