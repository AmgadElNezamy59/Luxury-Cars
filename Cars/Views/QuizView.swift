//
//  QuizView.swift
//  Cars
//
//  Created by Amgad ElNezamy
//

import SwiftUI

/// Ten quick questions drawn from the showroom. The best score is kept on device.
struct QuizView: View {
    @AppStorage("quiz.bestScore") private var bestScore = 0

    @State private var questions = Quiz.newRound()
    @State private var index = 0
    @State private var selection: String?
    @State private var score = 0
    @State private var isFinished = false
    @State private var isNewBest = false

    private var question: QuizQuestion { questions[index] }

    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if isFinished {
                        results
                    } else {
                        questionCard
                            .id(question.id)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing).combined(with: .opacity),
                                removal: .move(edge: .leading).combined(with: .opacity)
                            ))
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 24)
                .frame(maxWidth: 600)
                .frame(maxWidth: .infinity)
            }
            .background(Color(.systemGroupedBackground))
            // Pinned above the tab bar so it's reachable without scrolling, even on photo questions.
            .safeAreaInset(edge: .bottom) {
                if selection != nil && !isFinished {
                    Button(index + 1 < questions.count ? "Next Question" : "See Results", action: next)
                        .buttonStyle(ProminentButtonStyle())
                        .padding(.horizontal, 20)
                        .padding(.bottom, 12)
                        .frame(maxWidth: 600)
                        .transition(.opacity.combined(with: .move(edge: .bottom)))
                }
            }
            .navigationTitle("Quiz")
        }
    }

    // MARK: Question

    private var questionCard: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(spacing: 10) {
                HStack {
                    Text("Question \(index + 1) of \(questions.count)")
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text("Score \(score)")
                        .foregroundStyle(Theme.accent)
                }
                .eyebrowStyle()

                ProgressView(value: Double(index + (selection == nil ? 0 : 1)), total: Double(questions.count))
                    .tint(Theme.accent)
            }

            if let imageName = question.imageName {
                Image(decorative: imageName)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.4), radius: 12, y: 10)
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .background(
                        LinearGradient(colors: [Color(hex: 0x1A1A1C), Color(hex: 0x5A5D63)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing),
                        in: RoundedRectangle(cornerRadius: Theme.cardRadius, style: .continuous)
                    )
            }

            Text(question.prompt)
                .font(.system(.title2, design: .serif, weight: .bold))
                .fixedSize(horizontal: false, vertical: true)

            VStack(spacing: 10) {
                ForEach(question.options, id: \.self) { option in
                    AnswerButton(title: option, state: state(of: option)) {
                        choose(option)
                    }
                }
            }
            .sensoryFeedback(trigger: selection) { _, chosen in
                guard let chosen else { return nil }
                return chosen == question.answer ? .success : .error
            }
        }
    }

    private func state(of option: String) -> AnswerButton.Status {
        guard let selection else { return .open }
        if option == question.answer { return .correct }
        if option == selection { return .wrong }
        return .dimmed
    }

    private func choose(_ option: String) {
        guard selection == nil else { return }
        withAnimation(.snappy) {
            selection = option
            if option == question.answer { score += 1 }
        }
    }

    private func next() {
        withAnimation(.spring(duration: 0.4)) {
            if index + 1 < questions.count {
                index += 1
                selection = nil
            } else {
                isNewBest = score > bestScore
                bestScore = max(bestScore, score)
                isFinished = true
            }
        }
    }

    private func restart() {
        withAnimation(.spring(duration: 0.4)) {
            questions = Quiz.newRound()
            index = 0
            selection = nil
            score = 0
            isNewBest = false
            isFinished = false
        }
    }

    // MARK: Results

    private var results: some View {
        VStack(spacing: 16) {
            Image(systemName: "flag.checkered")
                .font(.system(size: 52))
                .foregroundStyle(Theme.accent)
                .padding(.top, 32)

            Text(verbatim: "\(score) / \(questions.count)")
                .font(.system(.largeTitle, design: .serif, weight: .bold))
                .monospacedDigit()

            Text(verdict)
                .font(.title3.weight(.semibold))

            Text(isNewBest ? "New personal best!" : "Personal best: \(bestScore) / \(questions.count)")
                .foregroundStyle(isNewBest ? Theme.accent : Color.secondary)

            Button("Play Again", action: restart)
                .buttonStyle(ProminentButtonStyle())
                .padding(.top, 16)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .sensoryFeedback(.success, trigger: isNewBest) { _, newValue in newValue }
    }

    private var verdict: LocalizedStringKey {
        switch Double(score) / Double(questions.count) {
        case 1: "Pole position!"
        case 0.7...: "A podium finish."
        case 0.4...: "In the points."
        default: "Back to the pit lane."
        }
    }
}

private struct AnswerButton: View {
    enum Status { case open, correct, wrong, dimmed }

    let title: String
    let state: Status
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Spacer()
                switch state {
                case .correct:
                    Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                case .wrong:
                    Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                default:
                    EmptyView()
                }
            }
            .font(.title3)
            .padding(.horizontal, 18)
            .padding(.vertical, 16)
            .background(background, in: RoundedRectangle(cornerRadius: Theme.tileRadius, style: .continuous))
            .opacity(state == .dimmed ? 0.5 : 1)
            .contentShape(Rectangle())
        }
        .buttonStyle(PressableStyle())
        .disabled(state != .open)
        .accessibilityValue(accessibilityValue)
    }

    private var background: Color {
        switch state {
        case .correct: .green.opacity(0.18)
        case .wrong: .red.opacity(0.16)
        default: Color(.secondarySystemGroupedBackground)
        }
    }

    private var accessibilityValue: Text {
        switch state {
        case .correct: Text("Correct answer")
        case .wrong: Text("Your answer, incorrect")
        default: Text("")
        }
    }
}

#Preview {
    QuizView()
}
