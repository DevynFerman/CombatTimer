//
//  ControlButtonStyle.swift
//  CombatTimer
//
//  Created by Devyn Ferman on 6/25/25.
//

import SwiftUI

struct ControlButtonStyle: ViewModifier {
    let color: Color
    let disabled: Bool
    func body(content: Content) -> some View {
        content
            .font(.title)
            .bold()
            .frame(width: 50, height: 50)
            .background(color.opacity(disabled ? 0.5 : 1.0))
            .foregroundStyle(.white)
            .clipShape(Circle())
            .disabled(disabled)
    }
}
