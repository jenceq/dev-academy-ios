import SwiftUI
import ActivityIndicatorView
struct PlacesScene: View {
    @EnvironmentObject private var coordinator: Coordinator
    let state = SceneStateView()
    var body: some View {
        NavigationStack {
            Group {
                if state.DataNonEmpty{
                    List(state.features, id: \.attributes.ogcFid){ feature in
                        NavigationLink(destination: coordinator.PlacesDetailScene(with: feature)) {
                            PlacesRow(feature: feature)
                        }

                    }
                    .listStyle(.plain)
                } else {
                    ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                }
            }
            .navigationTitle("Kultůrmapa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Oblíbené", action: state.FavoritesPressed)
                }
                
            }
        }
        .task{
            await state.fetchPlaces()
        }
        .sheet(isPresented: state.$showFavorites) {
            Text("Hello world")
           
            .presentationDragIndicator(.visible)
            .presentationDetents([.medium, .large])
        }
        .navigationBarTitleDisplayMode(.inline)
    }

   
}

//struct PlacesScene_Previews: PreviewProvider {
//    static var previews: some View {
//        PlacesScene()
//    }
//}
