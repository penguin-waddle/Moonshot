import SwiftUI

struct GridLayout: View {
    
    let missions: [Mission] // Creates an instance of the Mission array
    let astronauts: [String: Astronaut] // Creates an instance of the String/Astronaut dictionary
    
    let columns = [
        GridItem(.adaptive(minimum: 150)) // creates an adaptive, column based grid
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) { // sets our specified columns grid as columns
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName) // displays the mission name
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.formattedLaunchDate) // displays the mission date
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                                    .accessibilityLabel(mission.accessibleLaunchDate)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground) // sets the background color as specified in the Color-Theme.swift file
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        GridLayout(missions: Bundle.main.decode("missions.json"), astronauts: Bundle.main.decode("astronauts.json")) // decode the JSON files. We don't have to declare the type because SwiftUI already knows what types they are
            .preferredColorScheme(.dark)
    }
}

