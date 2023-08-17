//
//  Features.swift
//  DevAcademy
//
//  Created by To je jedno on 17.08.2023.
//

import Foundation
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
    
