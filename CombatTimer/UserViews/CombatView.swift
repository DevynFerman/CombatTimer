//
//  CombatView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/17/25.
//

import SwiftUI

struct CombatView: View {
    @Environment(PlayerRoster.self) var roster

    @AppStorage("defaultTimerLength")
    private var timerLength: String = "120"
    
    @AppStorage("defaultTimeRegain")
    private var timeRegainPerRound: String = "60"

    var body: some View {
        ScrollView {
            VStack {
                Text("Combat Timer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                ForEach(roster.players) { player in
                    TimerView(timerObject: player.playerTimer, controls: true)
                        .padding(.bottom, 10)
                }
            }
            .padding()
        }
    }
}
