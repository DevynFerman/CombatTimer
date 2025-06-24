//
//  PrimaryButtonStyle.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/18/25.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 200, maxHeight: 40)
            .background(Color(red: 0.1, green: 0.3, blue: 0.1))
            .foregroundColor(Color(red: 0.9, green: 0.75, blue: 0.2))
            .cornerRadius(25)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed)
    }
}
