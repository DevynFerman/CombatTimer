//  TimerView.swift
//  CombatTimer
//  Created by Devyn Ferman on 2/2/25.

/*
 A combat timer system built for team JZR as they explore Che'Annulo.
 FIWF!
 */

import SwiftUI

struct TimerView: View {
    let timerObject: TimerObject
    let controls: Bool

    @State private var width: CGFloat = 0

    var body: some View {
        VStack {
            HStack {
                Text("\(timerObject.timerName)")
                    .monospacedDigit()
                    .font(.system(size: width / 12))
                    .fontWeight(.bold)
                    .foregroundStyle(timerObject.timerColor)
            }
            ZStack {
                // MARK: Top Circle indicating countdown
                Circle()
                    .stroke(lineWidth: width / 10)
                    .foregroundStyle(timerObject.timerColor.opacity(0.4))

                // MARK: Recessed Circle under top circle
                Circle()
                    .trim(from: 0.0, to: min(1-timerObject.progress, 1.0))
                    .stroke(timerObject.timerColor.gradient, style: StrokeStyle(
                        lineWidth: width / 10,
                        lineCap: .round,
                        lineJoin: .miter))
                    .rotationEffect(.degrees(-90))
                    .shadow(radius: 2)

                // MARK: Tracking Circle
                Circle()
                    .stroke(lineWidth: width / 20)
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .shadow(color: timerObject.timerColor.opacity(0.6), radius: 5)
                    .frame(width: width / 8)
                    .offset(x: -width / 2)
                    .rotationEffect(.degrees(90.0 - 360 * timerObject.progress))

                // MARK: Countdown and original time
                VStack{
                    // Original Time
                    Text(displayTime(timerObject.length))
                        .monospacedDigit()
                        .font(.system(size: width / 12))
                    // Countdown
                    Text(displayTime(timerObject.remainingTime))
                        .monospacedDigit()
                        .font(.system(size: width / 3))
                }
                .foregroundStyle(timerObject.timerColor)
                .bold()
                .contentTransition(.numericText())
            }
            .readSize { size in
                width = size.width
            }
            .padding(width / 8)
            .animation(.linear, value: timerObject.remainingTime)

            if controls {
                HStack{
                    Button {
                        timerObject.startTimer()
                    } label: {
                        Image(systemName: "play.fill")
                    }
                    .modifier(ControlButtonStyle(color: timerObject.timerColor, disabled: timerObject.playButtonDisabled))

                    Button {
                        timerObject.stopTimer()
                    } label: {
                        Image(systemName: "pause.fill")
                    }
                    .modifier(ControlButtonStyle(color: timerObject.timerColor, disabled: timerObject.pauseButtonDisabled))

                    Button {
                        timerObject.resetTimer()
                    } label: {
                        Image(systemName: "gobackward")
                    }
                    .modifier(ControlButtonStyle(color: timerObject.timerColor, disabled: timerObject.resetButtonDisabled))
                }
            }
        }
    }

    func displayTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        
        return String(format: "%01d:%02d", minutes, seconds)
    }
}

#Preview {
    TimerView(timerObject: TimerObject(length: 120, timerName: "Devyn", timeRegain: 30), controls: true)
}


