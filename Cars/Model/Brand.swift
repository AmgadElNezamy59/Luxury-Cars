//
//  Brand.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

/// A luxury car marque. The `id` doubles as the name of its car image in the asset catalog.
struct Brand: Identifiable, Hashable {
    let id: String
    let name: String
    let tagline: String
    let founded: Int
    let country: String
    let headquarters: String
    /// Deep tone (behind the text) and lighter tone (behind the car) of the brand's backdrop.
    let colors: (deep: Color, light: Color)
    let story: [String]
    let models: [CarModel]
    let wikipedia: URL

    init(
        id: String, name: String, tagline: String,
        founded: Int, country: String, headquarters: String,
        colors: (deep: UInt32, light: UInt32),
        story: [String], models: [(name: String, kind: String)], wikipedia: String
    ) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.founded = founded
        self.country = country
        self.headquarters = headquarters
        self.colors = (Color(hex: colors.deep), Color(hex: colors.light))
        self.story = story
        self.models = models.map { CarModel(id: "\(id)/\($0.name)", name: $0.name, kind: $0.kind) }
        self.wikipedia = URL(string: wikipedia)!
    }

    static func == (lhs: Brand, rhs: Brand) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

/// A signature model. Its `id` ("brand/model") is unique across the app and is what the garage stores.
struct CarModel: Identifiable, Hashable {
    let id: String
    let name: String
    let kind: String
}

extension Color {
    init(hex: UInt32) {
        self.init(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }
}
