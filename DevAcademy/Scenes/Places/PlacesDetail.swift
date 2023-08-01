//
//  PlacesDetail.swift
//  DevAcademy
//
//  Created by To je jedno on 01.08.2023.
//

import SwiftUI

struct PlacesDetail: View {
    let feature: Feature
    var body: some View {
    
        HStack(alignment: .top){
                AsyncImage(url: feature.properties.obrId1){
                    image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 660)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 4)
                } placeholder: {
                    ProgressView()
                }
            VStack(spacing: 200){
                    Text(feature.properties.nazev)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    Text(feature.properties.druh.rawValue)
                        .foregroundColor(.secondary)
                        .font(.subheadline)
                        
                }
           
            }
        }
}

struct PlacesDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlacesDetail(feature: Features.mock.features[0])
    }
}
