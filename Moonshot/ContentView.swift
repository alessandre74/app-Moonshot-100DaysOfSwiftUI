//
//  ContentView.swift
//  Moonshot
//
//  Created by Alessandre Livramento on 27/10/22.
//

import SwiftUI

enum Types: String {
    case grid = "Grid"
    case list = "List"
}

struct ContentView: View {
    let astrounauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showGridOrListView = true

    var body: some View {
        NavigationView {
            Group {
                if showGridOrListView {
                    GridLayoutView(missions: missions, astronauts: astrounauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astrounauts)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button {
                    showGridOrListView = true
                } label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .foregroundColor(.white)
                }
                .toolbarButtonStyles(showGridOrListView: showGridOrListView, type: .grid)

                Button {
                    showGridOrListView = false
                } label: {
                    Image(systemName: "list.dash")
                        .foregroundColor(.white)
                }
                .toolbarButtonStyles(showGridOrListView: showGridOrListView, type: .list)
            }
        }
    }
}

struct toolbarButton: ViewModifier {
    var showGridOrListView: Bool
    var type: Types

    func body(content: Content) -> some View {
        content
            .frame(width: 32, height: 32)
            .buttonStyle(.borderless)
            .background(showGridOrListView && type == .grid ? .lightBackground : .darkBackground.opacity(0))
            .background(!showGridOrListView && type == .list ? .lightBackground : .darkBackground.opacity(0))
            .cornerRadius(4)
    }
}

extension View {
    func toolbarButtonStyles(showGridOrListView: Bool, type: Types) -> some View {
        modifier(toolbarButton(showGridOrListView: showGridOrListView, type: type))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
