//
//  Properties.swift
//  DevAcademy
//
//  Created by To je jedno on 17.08.2023.
//

import Foundation
struct Properties: Decodable {
    let ogcFid: Int
    let imageURL: URL?
    let type: PossibleKind
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case ogcFid = "ogc_fid"
        case imageURL = "obr_id1"
        case type = "druh"
        case name = "nazev"
    }
}
