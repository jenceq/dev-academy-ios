//
//  ukol1.swift
//  DevAcademy
//
//  Created by To je jedno on 18.07.2023.
//

import Foundation

enum Kind: String, Decodable{
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
enum PossibleKind: RawRepresentable, Decodable {
    init?(rawValue: String) {
        guard let kind = Kind(rawValue: rawValue) else{
            self = .unknown(rawValue)
            return
        }
        self = .kind(kind)
        
    }
    
    var rawValue: String{ //Read-only computed property

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
struct Properties: Decodable{
    let ogcFid: Int
    let imageURL: URL?
    let type: PossibleKind
    let name: String
    
    enum CodingKeys: String, CodingKey{
        case ogcFid = "ogc_fid"
        case imageURL = "obr_id1"
        case type = "druh"
        case name = "nazev"
    }


    
}
struct Point: Decodable{
    let latitude: Double
    let longitude: Double
    enum CodingKeys: String, CodingKey{
        case latitude = "x"
        case longitude = "y"
    }
}

struct Feature: Equatable, Decodable{
    static func == (lhs: Feature, rhs: Feature) -> Bool{
        lhs.attributes.ogcFid == rhs.attributes.ogcFid
    }
    let geometry: Point?
    let attributes: Properties
    
}
struct Features: Decodable{
    let features: [Feature]
    
    

      
}
extension Features {
    static let mock: Features = Features(
        features: [
            Feature(
                geometry: Point(latitude: 49.1913, longitude: 16.6115),
                attributes: Properties(
                    ogcFid: 1,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.divadlo),
                    name: "Národní divadlo Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2006, longitude: 16.6097),
                attributes: Properties(
                    ogcFid: 2,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kino),
                    name: "Kino Art Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2019, longitude: 16.6151),
                attributes: Properties(
                    ogcFid: 3,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.muzeum),
                    name: "Moravské zemské muzeum"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2079, longitude: 16.5938),
                attributes: Properties(
                    ogcFid: 4,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kulturniCentrum),
                    name: "BOUFOU Prostějovská Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2072, longitude: 16.6061),
                attributes: Properties(
                    ogcFid: 5,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.hudebniKlub),
                    name: "Kabinet múz"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1894, longitude: 165602),
                attributes: Properties(
                    ogcFid: 6,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.knihovna),
                    name: "Moravská zemská knihovna"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1914, longitude: 16.6126),
                attributes: Properties(
                    ogcFid: 7,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.koncertniHala),
                    name: "Janáčkovo divadlo"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.2182, longitude: 16.5893),
                attributes: Properties(
                    ogcFid: 8,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kulturniPamátka),
                    name: "Špilberk Brno"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1920, longitude: 16.6071),
                attributes: Properties(
                    ogcFid: 9,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.letniKino),
                    name: "Letní kino Lužánky"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 10,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.podnikSLulturnimProgramem),
                    name: "Bar, který neexistuje"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 11,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kino),
                    name: "Cinema City"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 12,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kino),
                    name: "Univerzitní kino Scala"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 13,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.hub),
                    name: "Impact Hub"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 14,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.kulturniPamátka),
                    name: "Villa Tugendhat"
                )
            ),
            Feature(
                geometry: Point(latitude: 49.1925, longitude: 16.6112),
                attributes: Properties(
                    ogcFid: 15,
                    imageURL: URL(string: "https://picsum.photos/200")!,
                    type: .kind(.vystaviste),
                    name: "Brněnské výstaviště"
                )
            )
        ]
    )

}
	
//class DataService{
//    private init(){
//
//    }
//
//    static var shared : DataService = DataService()
//    var data : Result<Features, Error>?
//
//
//    func fetchData(closure: @escaping (Result<Features, Error>) -> (Void) ){
//
//        if let data = data{
//            closure(data)
//            return
//        }
//        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] _ in
//
//            let data = DataService.mockData
//            self?.data = .success(data)
//            closure(.success(data))
//        }
//
//
//    }
//
//}
//extension DataService {
//
//    private static let mockData = Features.mock
//
//
//}
//

 



