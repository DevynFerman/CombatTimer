//
//  Player.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/17/25.
//

import Foundation
import SwiftUI

struct Player: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let initiativeOrder: Int
    let color: Color
    let playerTimer: TimerObject

    init (name: String, initiativeOrder: Int, playerTimer: TimerObject) {
        self.initiativeOrder = initiativeOrder
        self.name = name
        self.color = playerTimer.timerColor
        self.playerTimer = playerTimer
    }
}
