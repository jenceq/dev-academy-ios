//
//  PossibleKind.swift
//  DevAcademy
//
//  Created by To je jedno on 17.08.2023.
//

import Foundation
enum PossibleKind: RawRepresentable, Decodable {
    init?(rawValue: String) {
        guard let kind = Kind(rawValue: rawValue) else {
            self = .unknown(rawValue)
            return
        }
        self = .kind(kind)
        
    }
    
    var rawValue: String { //Read-only computed property

            switch self {
                case .kind(let neco):
                    return neco.rawValue
                case .unknown(let string):
                    return string
            }
    }

    case kind(Kind)
    case unknown(String)
    typealias RawValue = String
    
}
