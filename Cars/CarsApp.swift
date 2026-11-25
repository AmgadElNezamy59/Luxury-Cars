//
//  CarsApp.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

@main
struct CarsApp: App {
    @State private var garage = Garage()

    init() {
        Theme.applyNavigationBarStyle()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(garage)
        }
    }
}

struct RootView: View {
    private enum AppTab: Hashable {
        case showroom, garage
    }

    @Environment(Garage.self) private var garage
    @State private var selection = AppTab.showroom

    var body: some View {
        TabView(selection: $selection) {
            ShowroomView()
                .tabItem { Label("Showroom", systemImage: "car.fill") }
                .tag(AppTab.showroom)

            GarageView(browseShowroom: { selection = .showroom })
                .tabItem { Label("Garage", systemImage: "heart.fill") }
                .badge(garage.count)
                .tag(AppTab.garage)
        }
        .tint(Theme.accent)
    }
}

#Preview {
    RootView()
        .environment(Garage())
}
