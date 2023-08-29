import SwiftUI
import ActivityIndicatorView
struct PlacesScene: View {
    @EnvironmentObject private var coordinator: Coordinator
    let state = SceneViewState()
    var body: some View {
        NavigationStack {
            Group {
                if state.dataNonEmpty {
                    List(state.features, id: \.attributes.ogcFid) { feature in
                        NavigationLink(destination: coordinator.placesDetailScene(with: feature)) {
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Oblíbené", action: state.favoritesPressed)
                }
                
            }
        }
        .task {
            await state.fetchPlaces()
        }
        .sheet(isPresented: state.$showFavorites) {
            coordinator.favoritesScene
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
