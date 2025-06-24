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
    @State private var shouldNavigate = false
    @State private var initativeOrder: Int = 1

    var body: some View {
        NavigationStack {
            ZStack {
                Image("CombatSetup-BG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .offset(x: -45)

                VStack {
                    Text("Enter Character's Names in Initiative Order")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 75)

                    TextField("Character name", text: $currentName)
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)

                    if #available(iOS 26.0, *) {
                        Button("Add Player") {
                            let trimmedPlayerName = currentName.trimmingCharacters(in: .whitespaces)
                            guard !trimmedPlayerName.isEmpty else { return }
                            currentName = ""
                            UpdatePlayerRoster(name: trimmedPlayerName, initiativeOrder: initativeOrder)
                        }
                        .padding()
                        .buttonStyle(.glass)
                    } else {
                        Button("Add Player") {
                            let trimmedPlayerName = currentName.trimmingCharacters(in: .whitespaces)
                            guard !trimmedPlayerName.isEmpty else { return }
                            currentName = ""
                            UpdatePlayerRoster(name: trimmedPlayerName, initiativeOrder: initativeOrder)
                        }
                        .padding()
                        .buttonStyle(.automatic)                    }

                    InitiativeOrderListView()
                        .padding(.horizontal)

                    if #available(iOS 26.0, *) {
                        Button("Begin Combat!") {
                            shouldNavigate = true
                        }
                        .disabled(roster.players.isEmpty)
                        .buttonStyle(.glass)
                    } else {
                        Button("Begin Combat!") {
                            shouldNavigate = true
                        }
                        .disabled(roster.players.isEmpty)
                        .buttonStyle(.automatic)                    }
                }
                .navigationDestination(isPresented: $shouldNavigate) {
                    CombatView()
                }
            }
        }
    }

    private func UpdatePlayerRoster(name: String, initiativeOrder: Int) {
        let newPlayer = Player(name: name, initiativeOrder: initiativeOrder)
        roster.players.append(newPlayer)
        initativeOrder += 1
    }
}

#Preview {
    CombatSetupView()
}

