//
//  HomeScreenView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 2/2/25.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Prepare for Combat!") {
                    CombatSetupView()
                }
                .padding()
                NavigationLink("Settings") {
                    SettingsView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
