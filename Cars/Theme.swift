//
//  Theme.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI
import UIKit

/// The app's small design system: serif display type, soft continuous corners,
/// and a champagne-gold accent (defined in the AccentColor asset).
enum Theme {
    /// Read from the asset directly: on iOS 26 the global accent setting alone
    /// doesn't reach the tab bar or `Color.accentColor`.
    static let accent = Color("AccentColor")
    static let cardRadius: CGFloat = 28
    static let tileRadius: CGFloat = 18

    /// Serif navigation titles give every screen the same editorial feel.
    static func applyNavigationBarStyle() {
        let bar = UINavigationBar.appearance()
        bar.largeTitleTextAttributes = [.font: serifFont(.largeTitle, weight: .bold)]
        bar.titleTextAttributes = [.font: serifFont(.headline, weight: .semibold)]
    }

    private static func serifFont(_ style: UIFont.TextStyle, weight: UIFont.Weight) -> UIFont {
        let size = UIFont.preferredFont(forTextStyle: style).pointSize
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        guard let serif = font.fontDescriptor.withDesign(.serif) else { return font }
        return UIFont(descriptor: serif, size: size)
    }
}

extension View {
    /// Small, tracked, uppercase label used above titles and values.
    func eyebrowStyle() -> some View {
        font(.caption.weight(.semibold))
            .tracking(1.2)
            .textCase(.uppercase)
    }

    /// Marks the view a zoom navigation transition grows out of (iOS 18+).
    @ViewBuilder
    func zoomTransitionSource(id: String, in namespace: Namespace.ID) -> some View {
        if #available(iOS 18, *) {
            matchedTransitionSource(id: id, in: namespace)
        } else {
            self
        }
    }

    /// Opens the view with a zoom from its matching source (iOS 18+); a regular push otherwise.
    @ViewBuilder
    func zoomTransition(id: String, in namespace: Namespace.ID) -> some View {
        if #available(iOS 18, *) {
            navigationTransition(.zoom(sourceID: id, in: namespace))
        } else {
            self
        }
    }
}

/// Gently shrinks a card while it's pressed.
struct PressableStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .animation(.spring(duration: 0.25), value: configuration.isPressed)
    }
}
