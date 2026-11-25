//
//  TimelineView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

/// Every brand's milestones on one chronological line.
struct TimelineView: View {
    private let entries: [(brand: Brand, milestone: Milestone)] = Brand.all
        .flatMap { brand in brand.milestones.map { (brand, $0) } }
        .sorted { ($0.milestone.year, $0.brand.founded) < ($1.milestone.year, $1.brand.founded) }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("From the first motorcar to today's electric flagships.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    VStack(spacing: 0) {
                        ForEach(entries, id: \.milestone.id) { entry in
                            NavigationLink(value: entry.brand) {
                                MilestoneRow(
                                    brand: entry.brand,
                                    milestone: entry.milestone,
                                    isLast: entry.milestone.id == entries.last?.milestone.id
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
                .frame(maxWidth: 700)
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Timeline")
            .navigationDestination(for: Brand.self) { brand in
                BrandDetailView(brand: brand)
            }
        }
    }
}

private struct MilestoneRow: View {
    let brand: Brand
    let milestone: Milestone
    let isLast: Bool

    @ScaledMetric(relativeTo: .headline) private var yearWidth: CGFloat = 50

    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Text(String(milestone.year))
                .font(.system(.headline, design: .serif, weight: .bold))
                .monospacedDigit()
                .foregroundStyle(Theme.accent)
                .frame(width: yearWidth, alignment: .trailing)

            // The rail: a dot in the brand's colour on a continuous line.
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(.quaternary)
                    .frame(width: 2)
                    .frame(maxHeight: isLast ? 10 : .infinity)
                Circle()
                    .fill(brand.colors.light)
                    .overlay(Circle().strokeBorder(Color(.systemBackground), lineWidth: 2))
                    .frame(width: 13, height: 13)
                    .padding(.top, 4)
            }
            .frame(width: 13)

            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(brand.name)
                        .eyebrowStyle()
                        .foregroundStyle(.secondary)
                    Text(milestone.title)
                        .font(.headline)
                    Text(milestone.detail)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer(minLength: 0)
                Image(systemName: "chevron.right")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.tertiary)
            }
            .padding(.bottom, 26)
        }
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityHint(Text("Opens \(brand.name)"))
    }
}

#Preview {
    TimelineView()
        .environment(Garage())
}
