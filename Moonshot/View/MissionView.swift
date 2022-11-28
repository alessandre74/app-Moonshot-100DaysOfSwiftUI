//
//  MissionView.swift
//  Moonshot
//
//  Created by Alessandre Livramento on 29/10/22.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }

    let mission: Mission
    let crew: [CrewMember]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding([.top, .bottom])

                    HStack {
                        Image(systemName: mission.missionFormattedLaunchDate != "N/A" ? "calendar" : "")

                        Text(mission.missionFormattedLaunchDate)
                            .font(.headline)
                            .foregroundColor(.white)
                    }

                    VStack(alignment: .leading) {
                        DivisorView()

                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)

                        Text(mission.description)

                        DivisorView()

                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    CrewMemberView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .background(.darkBackground)
        .navigationTitle(mission.displayname)
        .navigationBarTitleDisplayMode(.inline)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        crew = mission.crew.map { menber in
            if let astronaut = astronauts[menber.name] {
                return CrewMember(role: menber.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(menber.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
