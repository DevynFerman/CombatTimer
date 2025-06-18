//
//  Player.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/17/25.
//

import Foundation
import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    let name: String
    let initiativeOrder: Int
    let color: Color
    
    init (name: String, initiativeOrder: Int) {
        self.initiativeOrder = initiativeOrder
        self.name = name
        self.color = Player.availableColors.randomElement() ?? .gray
    }
    
    private static let availableColors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .teal]
}
