import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("Astronauts.json")
    let missions: [Mission] = Bundle.main.decode("Missions.json")
    
    @AppStorage("showingGrid") private var showingGrid = true // Saves the users preference and remembers which type of grid to load
    
    var body: some View {
        NavigationView {
            Group { // use a group to wrap your conditions in a view, otherwise they won't work, which you can then add modifiers to.
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts) // if true, show the GridLayout view
                } else {
                    ListLayout(missions: missions, astronauts: astronauts) // if false, show the ListLayout view
                }
                ListLayout(missions: missions, astronauts: astronauts)
            }
            .toolbar {
                Button {
                    showingGrid.toggle() // Toggles showingGrid to false or true
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}
