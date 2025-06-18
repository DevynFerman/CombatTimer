//
//  CombatSetupView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/17/25.
//

import SwiftUI

struct CombatSetupView: View {
    @EnvironmentObject var roster: PlayerRoster

    @State private var currentName = ""
    @State private var playerNames: [String] = []
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Enter Character's Names in Initiative Order")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Character name", text: $currentName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Add Player") {
                    let trimmedPlayerName = currentName.trimmingCharacters(in: .whitespaces)
                    guard !trimmedPlayerName.isEmpty else { return }
                    playerNames.append(trimmedPlayerName)
                    currentName = ""
                }
                
                List(playerNames, id: \.self) { name in
                    Text(name)
                }
                
                Button("Begin Combat!") {
                    roster.players = PlayerRoster(players: playerNames).players
                    shouldNavigate = true
                }
                .disabled(playerNames.isEmpty)
            }
            .navigationDestination(isPresented: $shouldNavigate) {
                CombatView()
            }
        }
    }
}

#Preview {
    CombatSetupView()
}

