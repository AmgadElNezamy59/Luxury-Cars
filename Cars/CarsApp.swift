//
//  CarsApp.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

@main
struct CarsApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            }else {
                ListView()
            }
        }
    }
}
