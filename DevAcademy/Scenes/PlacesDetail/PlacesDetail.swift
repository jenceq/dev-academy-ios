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
    
        HStack(alignment: .top){
            AsyncImage(url: state.imageUrl){
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
