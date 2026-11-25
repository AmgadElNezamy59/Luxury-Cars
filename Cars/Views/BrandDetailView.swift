//
//  BrandDetailView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

struct BrandDetailView: View {
    let brand: Brand

    @Environment(Garage.self) private var garage
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.dynamicTypeSize) private var typeSize
    @State private var carHasArrived = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 20) {
                    BrandArtwork(
                        brand: brand,
                        carInsets: EdgeInsets(top: 28, leading: 24, bottom: 20, trailing: 20),
                        carOffset: carHasArrived ? 0 : 480
                    )
                    .frame(height: 250)
                    .accessibilityHidden(true)

                    Text(brand.tagline)
                        .font(.system(.title3, design: .serif))
                        .italic()
                        .foregroundStyle(.secondary)

                    facts
                }

                section("The Story") {
                    VStack(alignment: .leading, spacing: 14) {
                        ForEach(brand.story, id: \.self) { paragraph in
                            Text(paragraph)
                        }
                    }
                    .lineSpacing(5)
                }

                section("Signature Models") {
                    models
                    Text("Tap a model to park it in your garage.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 4)
                }

                Link(destination: brand.wikipedia) {
                    HStack {
                        Label("Read more on Wikipedia", systemImage: "book.closed")
                        Spacer()
                        Image(systemName: "arrow.up.right")
                            .font(.footnote.weight(.semibold))
                    }
                    .padding(16)
                    .background(Color(.secondarySystemBackground), in: tileShape)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .frame(maxWidth: 700)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(brand.name)
        .navigationBarTitleDisplayMode(.large)
        .onAppear(perform: driveCarIn)
    }

    private var facts: some View {
        let layout = typeSize.isAccessibilitySize
            ? AnyLayout(VStackLayout(spacing: 10))
            : AnyLayout(HStackLayout(spacing: 10))

        return layout {
            FactTile(title: "Founded", value: String(brand.founded))
            FactTile(title: "Origin", value: brand.country)
            FactTile(title: "Home", value: brand.headquarters)
        }
        .fixedSize(horizontal: false, vertical: true)
    }

    private var models: some View {
        VStack(spacing: 0) {
            ForEach(brand.models) { model in
                ModelRow(model: model, isSaved: garage.contains(model)) {
                    garage.toggle(model)
                }
                if model.id != brand.models.last?.id {
                    Divider().padding(.leading, 16)
                }
            }
        }
        .background(Color(.secondarySystemBackground), in: tileShape)
    }

    private var tileShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: Theme.tileRadius, style: .continuous)
    }

    private func section<Content: View>(
        _ title: LocalizedStringKey,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.system(.title2, design: .serif, weight: .bold))
                .accessibilityAddTraits(.isHeader)
            content()
        }
    }

    /// The car glides into the spotlight the first time the page opens.
    private func driveCarIn() {
        guard !carHasArrived else { return }
        if reduceMotion {
            carHasArrived = true
        } else {
            withAnimation(.spring(duration: 0.9, bounce: 0.18).delay(0.15)) {
                carHasArrived = true
            }
        }
    }
}

private struct FactTile: View {
    let title: LocalizedStringKey
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .eyebrowStyle()
                .foregroundStyle(.secondary)
            Text(value)
                .font(.system(.body, design: .serif, weight: .semibold))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(14)
        .background(
            Color(.secondarySystemBackground),
            in: RoundedRectangle(cornerRadius: Theme.tileRadius, style: .continuous)
        )
        .accessibilityElement(children: .combine)
    }
}

private struct ModelRow: View {
    let model: CarModel
    let isSaved: Bool
    let toggle: () -> Void

    var body: some View {
        Button(action: toggle) {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(model.name)
                        .font(.headline)
                    Text(model.kind)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer(minLength: 8)
                Image(systemName: isSaved ? "heart.fill" : "heart")
                    .font(.title3)
                    .foregroundStyle(isSaved ? Theme.accent : Color.secondary)
                    .contentTransition(.symbolEffect(.replace))
                    .symbolEffect(.bounce, value: isSaved)
                    .accessibilityHidden(true)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .sensoryFeedback(trigger: isSaved) { _, saved in
            saved ? .success : .impact(weight: .light)
        }
        .accessibilityValue(isSaved ? Text("In your garage") : Text(""))
        .accessibilityHint(isSaved ? Text("Removes it from your garage") : Text("Adds it to your garage"))
        .accessibilityAddTraits(isSaved ? .isSelected : [])
    }
}

#Preview {
    NavigationStack {
        BrandDetailView(brand: Brand.all[6])
    }
    .environment(Garage())
}
