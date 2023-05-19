//
//  Car.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

struct Car: Identifiable {
    let id = UUID()
    let title : String
    let headline: String
    let image: String
    let gradientColors:[Color]
    let description: String
    let models: [String]
}
