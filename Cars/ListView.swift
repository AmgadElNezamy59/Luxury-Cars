//
//  ListView.swift
//  Cars
//
//  Created by Amgad ElNezamy

import SwiftUI

struct ListView: View {
    @State var isSettingVeiwPresented : Bool = false
    var body: some View {
        NavigationView {
            List {
                ForEach(carsData) { item in
                    
                    NavigationLink(destination: DetailedView(car: item)) {
                        CellView(car: item)
                            .padding(.vertical,4)
                        
                    }//: Navigatoin Link
                }
            }//: List
            .navigationTitle("Cars")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: Button(action: {
                //Add code later
                isSettingVeiwPresented = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
                   
            }))
            .sheet(isPresented: $isSettingVeiwPresented) {
                SettingView()
            }
        }//: Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .preferredColorScheme(.light)
    }
}
