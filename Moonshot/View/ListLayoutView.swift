//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Alessandre Livramento on 07/11/22.
//

import SwiftUI

struct ListLayoutView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    let columns = [GridItem(.adaptive(minimum: 200))]

    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)

                        HStack {
                            Text(mission.displayname)
                                .font(.headline)
                                .foregroundColor(.white)

                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                                .frame(width: 100)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
            .padding(.vertical, 1)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .background(.darkBackground)
        .scrollContentBackground(.hidden)
        .preferredColorScheme(.dark)
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        ListLayoutView(missions: missions, astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
