//
//  ContentView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView{
            ForEach(carsData) { item in
                CardView(car: item)
                    .cornerRadius(15)
                    .padding(.horizontal,10)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
