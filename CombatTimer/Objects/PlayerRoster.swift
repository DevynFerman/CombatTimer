//
//  PlayerRoster.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/18/25.
//

import Foundation
import SwiftUI

class PlayerRoster: ObservableObject {
    @Published var players: [Player] = []
    
    init() {}
    
    init(players: [String]) {
        var initOrder = 1
        for player in players {
            let newPlayer = Player(name: player, initiativeOrder: initOrder)
            initOrder += 1
            self.players.append(newPlayer)
        }
    }
}

//func load(from names: [String]) {
//players = names.enumerated().map { index, name in
//    Player(name: name, initiativeOrder: index + 1)
//}
//}

//roster.load(from: playerNames)
