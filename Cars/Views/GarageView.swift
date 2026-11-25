//
//  GarageView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

/// The user's saved models, grouped by marque.
struct GarageView: View {
    var browseShowroom: () -> Void

    @Environment(Garage.self) private var garage

    var body: some View {
        NavigationStack {
            let collection = garage.collection

            Group {
                if collection.isEmpty {
                    emptyState
                } else {
                    List {
                        ForEach(collection, id: \.brand.id) { entry in
                            Section {
                                ForEach(entry.models) { model in
                                    row(for: model, of: entry.brand)
                                }
                            } header: {
                                header(for: entry.brand)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Garage")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if !collection.isEmpty {
                        ShareLink(item: shareText(for: collection)) {
                            Label("Share Garage", systemImage: "square.and.arrow.up")
                        }
                    }
                }
            }
            .navigationDestination(for: Brand.self) { brand in
                BrandDetailView(brand: brand)
            }
        }
    }

    private var emptyState: some View {
        ContentUnavailableView {
            Label("Your Garage Is Empty", systemImage: "car.side")
        } description: {
            Text("Open any marque in the Showroom and tap a model to park it here.")
        } actions: {
            Button("Explore the Showroom", action: browseShowroom)
                .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }

    private func header(for brand: Brand) -> some View {
        HStack(spacing: 12) {
            Text(brand.name)
                .font(.system(.title3, design: .serif, weight: .bold))
                .foregroundStyle(Color.primary)
            Spacer()
            Image(decorative: brand.id)
                .resizable()
                .scaledToFit()
                .frame(height: 32)
        }
        .textCase(nil)
    }

    private func row(for model: CarModel, of brand: Brand) -> some View {
        NavigationLink(value: brand) {
            VStack(alignment: .leading, spacing: 2) {
                Text(model.name)
                    .font(.headline)
                Text(model.kind)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 2)
        }
        .swipeActions {
            Button(role: .destructive) {
                withAnimation { garage.remove(model) }
            } label: {
                Label("Remove", systemImage: "heart.slash")
            }
            .tint(.red)
        }
    }

    private func shareText(for collection: [(brand: Brand, models: [CarModel])]) -> String {
        let cars = collection.flatMap { entry in
            entry.models.map { "• \(entry.brand.name) \($0.name)" }
        }
        return (["My dream garage:"] + cars).joined(separator: "\n")
    }
}

#Preview {
    GarageView(browseShowroom: {})
        .environment(Garage())
}
