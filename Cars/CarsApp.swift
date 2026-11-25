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
    @State private var showsSplash = true

    init() {
        Theme.applyNavigationBarStyle()
    }

    var body: some Scene {
        WindowGroup {
            ZStack {
                RootView()

                if showsSplash {
                    SplashView {
                        withAnimation(.easeOut(duration: 0.45)) { showsSplash = false }
                    }
                    .transition(.opacity.combined(with: .scale(scale: 1.08)))
                    .zIndex(1)
                }
            }
            .environment(garage)
        }
    }
}

struct RootView: View {
    private enum AppTab: Hashable {
        case showroom, timeline, quiz, garage
    }

    @Environment(Garage.self) private var garage
    @State private var selection = AppTab.showroom

    var body: some View {
        TabView(selection: $selection) {
            ShowroomView()
                .tabItem { Label("Showroom", systemImage: "car.fill") }
                .tag(AppTab.showroom)

            TimelineView()
                .tabItem { Label("Timeline", systemImage: "hourglass") }
                .tag(AppTab.timeline)

            QuizView()
                .tabItem { Label("Quiz", systemImage: "flag.checkered") }
                .tag(AppTab.quiz)

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
