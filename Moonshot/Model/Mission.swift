//
//  Mission.swift
//  Moonshot
//
//  Created by Alessandre Livramento on 28/10/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct Crewrole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [Crewrole]
    let description: String

    var displayname: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }

    var missionFormattedLaunchDate: String {
        launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
