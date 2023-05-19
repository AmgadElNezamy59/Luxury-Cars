//
//  DetailedView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

struct DetailedView: View {
    //Properties
    
    var car: Car
    
    //Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack {
                
                //HeaderView for Car
                HeaderView(car: car)
                
                VStack (alignment: .leading, spacing: 15 ){
                    //Car Title
                    Text(car.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(car.gradientColors[0])
                    
                    
                    //Car Headline
                    Text(car.headline)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    
                    
                    //Car Model
                    ModelView(car: car)
                    
                    //Description
                    Text("Lear more about \(car.title)")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(car.gradientColors[0])
                    
                    Text(car.description)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    //Links
                    FooterView()
                        .padding(.bottom, 40)
                    
                    
                    
                }//: VStack
                .padding(.horizontal,15)
                .frame(maxWidth: 620)
            }//: VStack End of main screen
        }//: Scrolview
        .ignoresSafeArea(.all)
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(car: carsData[1])
    }
}



struct FooterView: View {
    var body: some View {
        GroupBox () {
            HStack {
                Link("Source: Widipedia", destination: URL(string: "https:/wikipedia.com")!)
                Spacer()
                Image(systemName: "arrow.up.right.square")
                
            }
        }
    }
}
