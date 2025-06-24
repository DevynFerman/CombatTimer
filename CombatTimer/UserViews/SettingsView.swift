//
//  SettingsView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/18/25.
//

import Foundation
import SwiftUI

public struct SettingsView: View {
    @AppStorage("defaultTimerLength") private var timerLength: String = "120"
    @AppStorage("defaultTimeRegain") private var timeRegainPerRound: String = "60"
    
    public var body: some View {
        ZStack {
            Image("Homepage-BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Header
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // Timer Length
                HStack {
                    Text("Timer Length:")
                    TextField("In Seconds (Ex: 3min. = 180)", text: $timerLength)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                .padding(.leading)

                // Time Regain
                HStack {
                    Text("Time Regained Per Round:")
                    TextField("In Seconds (Ex: 1min. = 60)", text: $timeRegainPerRound)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .padding(.trailing)
                }
                .padding(.leading)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    SettingsView()
}
