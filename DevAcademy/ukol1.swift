//
//  ukol1.swift
//  DevAcademy
//
//  Created by To je jedno on 18.07.2023.
//

import Foundation

enum Kind: String{
    case divadlo = "Divadlo"
    case galerie = "Galerie"
    case hub = "Hub"
    case hudebniKlub = "Hudebni klub"
    case kino = "Kino"
    case knihovna = "Knihovna"
    case koncertniHala = "Koncertní hala"
    case kulturniCentrum = "Kulturní centrum"
    case kulturniPamátka = "Kulturní památka"
    case letniKino = "Letní kino"
    case muzeum = "Muzeum"
    case podnikSLulturnimProgramem = "Podnik s kulturním programem"
    case vystaviste = "Výstaviště"
    case ostatni = "Ostatní"
}
enum PossibleKind: RawRepresentable {
    init?(rawValue: String) {
        guard let kind = Kind(rawValue: rawValue) else{
            self = .unknown(rawValue)
            return
        }
        self = .kind(kind)
        
    }
    
    var rawValue: String{ //Read-only computer property

            switch self{
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
struct Properties {
    let ogcFid: Int
    let obrId1: URL
    let druh: PossibleKind
    let název: String
    
}
struct Point{
    let latitude: Double
    let longitude: Double
}
struct Feature{
    let geometry: Point
    let properties: Properties
}
struct Features{
    let features: [Feature]
}
	
class DataService{
    private init(){
        
    }

    static var shared : DataService = DataService()
    var data : Result<Features, Error>?

    func fetchData(closure: (_ data: Result<Features, Error>) -> (Void) ){
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            
            self?.data = .success(DataService.mockData)

        }
        guard let data = data else{
            
            return
        }
        closure(data)
    }
    
}
extension DataService {
    private static var mockData : Features = Features.init(features: [])
}


 



