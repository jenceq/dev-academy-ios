//
//  PlacesDetail.swift
//  DevAcademy
//
//  Created by To je jedno on 01.08.2023.
//

import SwiftUI

struct PlacesDetail: View {
    let state: PlacesDetailViewState
    
    var body: some View {
    
        HStack(alignment: .top) {
            if let imagePath = state.imageUrl {
                StoredAsyncImage(url: imagePath) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(radius: 4)
                } placeholder: {
                    ProgressView()
                }
            } else {

            }
            VStack(spacing: 200) {
                Text(state.placeTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
            }
           
            }
        }
}

//struct PlacesDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacesDetail(feature: Features.mock.features[0])
//    }
//}
