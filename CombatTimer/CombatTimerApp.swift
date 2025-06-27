//
//  CombatTimerApp.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 2/2/25.
//

import SwiftUI

@main
struct CombatTimerApp: App {
    private var roster = PlayerRoster()

    var body: some Scene {
        WindowGroup {
            HomeScreenView(roster: roster)
                .environment(roster)

        }
    }
}
