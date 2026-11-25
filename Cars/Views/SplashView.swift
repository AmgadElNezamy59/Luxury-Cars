//
//  SplashView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

/// Picks up exactly where the launch screen (Info.plist → UILaunchScreen) leaves off:
/// the wheel turns, the name appears, then the showroom opens.
struct SplashView: View {
    let onFinish: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var wheelAngle = 0.0
    @State private var showsTitle = false

    var body: some View {
        ZStack {
            Color("LaunchBackground")
                .ignoresSafeArea()

            // Same image, size and centre as the launch screen, so the hand-off is seamless.
            Image(decorative: "LaunchEmblem")
                .rotationEffect(.degrees(wheelAngle))
                .overlay(alignment: .bottom) {
                    title
                        .alignmentGuide(.bottom) { $0[.top] - 32 }
                        .offset(y: showsTitle ? 0 : 12)
                        .opacity(showsTitle ? 1 : 0)
                }
        }
        .task { await play() }
    }

    private var title: some View {
        VStack(spacing: 8) {
            Text("Luxury Cars")
                .font(.system(.title, design: .serif, weight: .bold))
                .foregroundStyle(Color(hex: 0xEBD7AE))
            Text("Eight legendary marques")
                .eyebrowStyle()
                .foregroundStyle(.white.opacity(0.55))
        }
        .fixedSize()
    }

    private func play() async {
        if reduceMotion {
            withAnimation(.easeOut(duration: 0.3)) { showsTitle = true }
            try? await Task.sleep(for: .seconds(0.9))
        } else {
            withAnimation(.easeInOut(duration: 0.35)) { wheelAngle = -28 }
            try? await Task.sleep(for: .seconds(0.35))
            withAnimation(.spring(duration: 0.6, bounce: 0.35)) { wheelAngle = 0 }
            withAnimation(.easeOut(duration: 0.45).delay(0.1)) { showsTitle = true }
            try? await Task.sleep(for: .seconds(0.8))
        }
        onFinish()
    }
}

#Preview {
    SplashView(onFinish: {})
}
