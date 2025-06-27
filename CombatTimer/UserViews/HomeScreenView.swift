//
//  HomeScreenView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 2/2/25.
//

import SwiftUI

struct HomeScreenView: View {
    var roster: PlayerRoster

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Homepage-BG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    NavigationLink("Prepare for Combat!") {
                        CombatSetupView(roster: roster)
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding()
                    
                    NavigationLink("Settings") {
                        SettingsView()
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding()
                }
            }
        }
    }
}
