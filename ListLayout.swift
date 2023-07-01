import SwiftUI

struct ListLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                            .accessibilityLabel(mission.accessibleLaunchDate)
                    }
                }
            }
            .listRowBackground(Color.darkBackground) // Sets our custom dark background color as background for the list
        }
        .listStyle(.plain) // Makes the list take the full width of the screen
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout(missions: Bundle.main.decode("missions.json"), astronauts: Bundle.main.decode("astronauts.json"))
            .preferredColorScheme(.dark)
    }
}
