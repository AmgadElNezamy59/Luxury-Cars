//
//  SettingView.swift
//  Cars
//
//  Created by Amgad ElNezamy

import SwiftUI

struct SettingView: View {
    //Properties
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @Environment(\.presentationMode) var presentationMode
    //Body
    var body: some View {
        NavigationView{
            
            VStack {
            //Group Box
            GroupBox () {
                HStack {
                    Text("cars".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "info.circle")
                        .font(.title)
                    
                }// :HStack First cell
                Divider()
                HStack {
                    Image("icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80, alignment: .center)
                    Text("Cars app includes very important information about the luxutry cars, it ahs details about the history of different models")
                    
                }// :HStack Second cell
                
            }//: Group Box
            
            
            // Check box
                Toggle(isOn: $isOnboarding) {
                    
                    if isOnboarding {
                        Text("Restarted".uppercased())
                            .font(.title)
                            .foregroundColor(.green)
                    } else {
                        Text("Restart".uppercased())
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                    
                    
                }
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(8)
                
                Spacer()
                
            }//: Vstack Main
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button(action: {
                //Add code to close the sheet
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle")
                    .font(.title2)
            }))
                
                
        }//: Navigation View
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
