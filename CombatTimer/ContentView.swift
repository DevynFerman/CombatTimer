//
//  ContentView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 2/2/25.
//

import SwiftUI

struct ContentView: View {
    let timerForRex = TimerObject(timerColor: .red, length: 120, timerName: "Rex")
    let timerForAustin = TimerObject(timerColor: .blue, length: 120, timerName: "Austin")
    let timerForRyan = TimerObject(timerColor: .green, length: 120, timerName: "Ryan")
    let timerForDevyn = TimerObject(timerColor: .purple, length: 120, timerName: "Devyn")
    var body: some View {
        VStack {
            Text("Combat Timer")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .padding()
        HStack {
            TimerView(timerObject: timerForRex, controls: true)
            TimerView(timerObject: timerForAustin, controls: true)
        }
        .padding()
        HStack {
            TimerView(timerObject: timerForRyan, controls: true)
            TimerView(timerObject: timerForDevyn, controls: true)
        }

    }
}

#Preview {
    ContentView()
}
