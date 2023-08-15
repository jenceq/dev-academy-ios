//
//  PlacesObservableObject.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import Foundation
final class PlacesObservableObject: ObservableObject {
    @Published var feature: [Feature] = []
    
    private let dataService: DataService = DataService.shared
    func fetch() {
        dataService.fetchData { result in
            switch result {
            case .success(let features):
                self.feature = features.features
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
