//
//  PlacesService.swift
//  DevAcademy
//
//  Created by To je jedno on 15.08.2023.
//

import Foundation
enum APIError : Error {
    case invalidResponse
}
protocol PlacesService {
    func places() async throws -> Features
}
class ProductionPlacesService : PlacesService {
    func places() async throws -> Features {
        let url = URL(string: "https://gis.brno.cz/ags1/rest/services/OMI/omi_ok_kulturni_instituce/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")!
        var request = URLRequest(url: url)
        request.httpMethod   = "GET"
        let session = URLSession.shared
        let (data, response) = try await session.data(for: request)
        guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
            throw APIError.invalidResponse
        }
        return try JSONDecoder().decode(Features.self, from: data)
    }
}
class MockPlacesService: PlacesService {
    func places() async throws -> Features {
        Features.mock
    }
    
}
