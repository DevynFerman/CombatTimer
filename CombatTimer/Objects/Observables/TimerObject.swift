//
//  TimerObject.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 2/2/25.
//

import Foundation
import Observation
import SwiftUI

// This should be renamed to TimerViewModel and refactored, at some point.
@Observable
class TimerObject {

    let timerColor: Color
    let timerName: String
    let timeRegain: Int
    var length: Int
    private static let availableColors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .teal]

    init(length: Int, timerName: String, timeRegain: Int) {
        self.timerColor = TimerObject.availableColors.randomElement() ?? .gray
        self.timerName = timerName
        self.timeRegain = timeRegain
        self.length = length
    }

    var timer: Timer? = nil
    var timeElapsed = 0

    var isRunning: Bool = false

    var remainingTime: Int {
        length - timeElapsed
    }

    var newMaxLength: Int {
        remainingTime + timeElapsed
    }

    var progress: CGFloat {
        CGFloat(length - remainingTime) / CGFloat(length)
    }

    func startTimer() {
        guard !isRunning else { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            if remainingTime > 0 {
                timeElapsed += 1
            } else {
                stopTimer()
            }
        }
    }

    func stopTimer() {
        guard isRunning else { return }
        isRunning = false
        timer?.invalidate()
    }

    func resetTimer() {
        self.length = findNewLength(remainingTime)
        timeElapsed = 0
        isRunning = false
    }

    func findNewLength(_ remainingTime: Int) -> Int{
        if remainingTime + 60 < length {
            return remainingTime + 60
        } else {
            return length
        }
    }

    var playButtonDisabled: Bool {
        guard remainingTime > 0, !isRunning else { return true }
        return false
    }

    var pauseButtonDisabled: Bool {
        guard remainingTime > 0, isRunning else { return true }
        return false
    }

    var resetButtonDisabled: Bool {
        guard remainingTime != length, !isRunning else { return true }
        return false
    }
}

extension TimerObject: Equatable {
    static func == (lhs: TimerObject, rhs: TimerObject) -> Bool {
        if lhs.timerName != rhs.timerName ||
           lhs.timeRegain != rhs.timeRegain {
            return false
        }
        return true
    }

    static func < (lhs: TimerObject, rhs: TimerObject) -> Bool {
        lhs.remainingTime < rhs.remainingTime
    }
}

extension TimerObject: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(timerName)
        hasher.combine(timeRegain)
    }
}
