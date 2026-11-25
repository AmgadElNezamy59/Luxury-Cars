//
//  Quiz.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import Foundation

struct QuizQuestion: Identifiable {
    let id = UUID()
    let prompt: String
    /// Asset name of a car photo to show with the question, if any.
    let imageName: String?
    let options: [String]
    let answer: String
}

/// Builds quiz rounds from the showroom's own content, so the questions always match the app.
enum Quiz {
    static let length = 10

    static func newRound() -> [QuizQuestion] {
        let brands = Brand.all
        let names = brands.map(\.name)
        let cities = brands.map(\.headquarters)

        // One pool per kind of question, each shuffled.
        let pools: [[QuizQuestion]] = [
            brands.map { question("Which marque makes this car?", image: $0.id, answer: $0.name, from: names) },
            brands.map { question("Which marque was founded in \($0.founded)?", answer: $0.name, from: names) },
            brands.map { question("Where is \($0.name) based?", answer: $0.headquarters, from: cities) },
            brands.compactMap { brand in
                brand.models.randomElement().map {
                    question("Which marque builds the \($0.name)?", answer: brand.name, from: names)
                }
            },
        ].map { $0.shuffled() }

        // Deal from the pools in turn so every round mixes all four kinds.
        var round: [QuizQuestion] = []
        for depth in 0..<brands.count {
            for pool in pools.shuffled() where round.count < length && depth < pool.count {
                round.append(pool[depth])
            }
        }
        return round
    }

    /// One correct answer plus three distinct wrong ones, in random order.
    private static func question(
        _ prompt: String, image: String? = nil, answer: String, from candidates: [String]
    ) -> QuizQuestion {
        let wrong = Set(candidates).subtracting([answer]).shuffled().prefix(3)
        return QuizQuestion(prompt: prompt, imageName: image, options: ([answer] + wrong).shuffled(), answer: answer)
    }
}
