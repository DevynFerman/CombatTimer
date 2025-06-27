//
//  PlayerRoster.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/18/25.
//

import Foundation
import Observation
import SwiftUI

@Observable
class PlayerRoster {
    var players: [Player] = []
    
    init() {}
}

//func load(from names: [String]) {
//players = names.enumerated().map { index, name in
//    Player(name: name, initiativeOrder: index + 1)
//}
//}

//roster.load(from: playerNames)
