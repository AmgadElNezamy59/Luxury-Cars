//
//  ShowroomView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

struct ShowroomView: View {
    @Namespace private var zoom
    private let columns = [GridItem(.adaptive(minimum: 320), spacing: 16)]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Eight legendary marques, in the order they were born.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 4)

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(Brand.all) { brand in
                            NavigationLink(value: brand) {
                                BrandCard(brand: brand)
                            }
                            .buttonStyle(PressableStyle())
                            .zoomTransitionSource(id: brand.id, in: zoom)
                            .scrollTransition { content, phase in
                                content
                                    .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                    .opacity(phase.isIdentity ? 1 : 0.6)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 24)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Showroom")
            .navigationDestination(for: Brand.self) { brand in
                BrandDetailView(brand: brand)
                    .zoomTransition(id: brand.id, in: zoom)
            }
        }
    }
}

/// A showroom card: the brand's name over its spotlit car.
struct BrandCard: View {
    let brand: Brand
    @ScaledMetric(relativeTo: .title) private var height: CGFloat = 220

    var body: some View {
        BrandArtwork(brand: brand)
            .frame(height: height)
            .overlay(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(verbatim: "\(brand.country) · Est. \(brand.founded)")
                        .eyebrowStyle()
                        .foregroundStyle(.white.opacity(0.7))
                    Text(brand.name)
                        .font(.system(.title, design: .serif, weight: .bold))
                        .foregroundStyle(.white)
                }
                .padding(22)
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text(verbatim: "\(brand.name), \(brand.country), founded \(brand.founded)"))
    }
}

/// The brand's backdrop (a deep-to-light gradient with a showroom spotlight) and its car.
struct BrandArtwork: View {
    let brand: Brand
    var carInsets = EdgeInsets(top: 72, leading: 64, bottom: 16, trailing: 16)
    var carOffset: CGFloat = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [brand.colors.deep, brand.colors.light],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            RadialGradient(
                colors: [.white.opacity(0.32), .clear],
                center: UnitPoint(x: 0.66, y: 0.72),
                startRadius: 0,
                endRadius: 230
            )
            Image(decorative: brand.id)
                .resizable()
                .scaledToFit()
                .shadow(color: .black.opacity(0.45), radius: 14, y: 12)
                .padding(carInsets)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .offset(x: carOffset)
        }
        .clipShape(RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                .strokeBorder(.white.opacity(0.08))
        }
    }
}

#Preview {
    ShowroomView()
        .environment(Garage())
}
