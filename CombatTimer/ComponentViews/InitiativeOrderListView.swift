//
//  InitiativeOrderListView.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/23/25.
//

import Foundation
import SwiftUI

struct InitiativeOrderListView: View {
    @Bindable var roster: PlayerRoster

    var body: some View {
            List {
                ForEach(roster.players, id: \.name) { player in
                    Text(player.name)
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
                .listRowBackground(Color.white.opacity(0.25))
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .padding(.horizontal)
            .environment(\.editMode, .constant(.active))
            .navigationTitle("Initiative Order")
    }

    private func move(from source: IndexSet, to destination: Int) {
        withAnimation {
            roster.players.move(fromOffsets: source, toOffset: destination)
        }
    }

    private func delete(at offsets: IndexSet) {
        withAnimation {
            roster.players.remove(atOffsets: offsets)
        }
    }
}
