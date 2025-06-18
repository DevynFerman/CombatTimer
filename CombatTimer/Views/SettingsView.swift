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
    
    public var body: some View {
        VStack {
            // Header
            Text("Settings")
                .font(.headline)
                .padding()
            
            // Timer Length
            HStack {
                Text("Timer Length:")
                TextField("In Seconds (Example: 3 min. = 180)", text: $timerLength)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
            }
        }
    }
}

#Preview {
    SettingsView()
}
