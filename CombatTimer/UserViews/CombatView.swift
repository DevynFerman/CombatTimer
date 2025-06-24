//
//  CombatView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/17/25.
//

import SwiftUI

struct CombatView: View {
    @EnvironmentObject
    var roster: PlayerRoster
    
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
                    TimerView(
                        timerObject: TimerObject(
                            timerColor: player.color,
                            length: Int(timerLength) ?? 120,
                            timerName: player.name,
                            timeRegain: Int(timeRegainPerRound) ?? 60
                        ),
                        controls: true
                    )
                    .padding(.bottom, 10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CombatView()
}
