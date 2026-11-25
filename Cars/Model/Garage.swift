//
//  Garage.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import Foundation
import Observation

/// The user's dream garage: the models they've saved, persisted on device.
@Observable
final class Garage {
    private static let storageKey = "garage.modelIDs"

    private var modelIDs: Set<String> {
        didSet { UserDefaults.standard.set(modelIDs.sorted(), forKey: Self.storageKey) }
    }

    init() {
        modelIDs = Set(UserDefaults.standard.stringArray(forKey: Self.storageKey) ?? [])
    }

    func contains(_ model: CarModel) -> Bool {
        modelIDs.contains(model.id)
    }

    func toggle(_ model: CarModel) {
        if contains(model) {
            modelIDs.remove(model.id)
        } else {
            modelIDs.insert(model.id)
        }
    }

    func remove(_ model: CarModel) {
        modelIDs.remove(model.id)
    }

    /// Saved models grouped by brand, in showroom order.
    var collection: [(brand: Brand, models: [CarModel])] {
        Brand.all.compactMap { brand in
            let saved = brand.models.filter(contains)
            return saved.isEmpty ? nil : (brand, saved)
        }
    }

    var count: Int {
        collection.reduce(0) { $0 + $1.models.count }
    }
}
