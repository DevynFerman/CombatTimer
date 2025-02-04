//
//  TimerObject.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 2/2/25.
//

import Foundation
import SwiftUI

@Observable
class TimerObject {
    let timerColor: Color
    let timerName: String
    var length: Int


    init(timerColor: Color, length: Int, timerName: String) {
        self.timerColor = timerColor
        self.length = length
        self.timerName = timerName
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
