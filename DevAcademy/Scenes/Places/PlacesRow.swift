//
//
//  PlacesRow.swift
//  DevAcademy
//
//  Created by To je jedno on 25.07.2023.
//

import SwiftUI

struct PlacesRow: View {
    let feature: Feature
    var body: some View {
        HStack {
            AsyncImage(url: feature.attributes.imageURL){
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .shadow(radius: 4)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(feature.attributes.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                Text(feature.attributes.type.rawValue)
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            }
        }
    }
}

struct PlacesRow_Previews: PreviewProvider {
    static var previews: some View {
        PlacesRow(feature: Features.mock.features[0])
    }
}
