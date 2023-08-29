//
//  RootView.swift
//  DevAcademy
//
//  Created by To je jedno on 08.08.2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    
    var body: some View {
        coordinator.placesScene
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
