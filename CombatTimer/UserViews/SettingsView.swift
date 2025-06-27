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

            ScrollView {
                VStack {
                    // Header
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(red: 0.9, green: 0.75, blue: 0.2))
                        .padding()

                    // Timer Length
                    VStack {
                        Text("Timer Length:")
                            .bold()
                            .background(.ultraThinMaterial)
                        TextField("In Seconds (Ex: 3 minutes = 180)", text: $timerLength)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                    }
                    .padding()

                    // Time Regain
                    VStack {
                        Text("Time Regained Per Round:")
                            .bold()
                            .background(.ultraThinMaterial)
                        TextField("In Seconds (Ex: 1 minute = 60)", text: $timeRegainPerRound)
                            .textFieldStyle(.roundedBorder)
                            .keyboardType(.numberPad)
                    }
                    .padding()
                }
                .padding(.horizontal)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SettingsView()
}
