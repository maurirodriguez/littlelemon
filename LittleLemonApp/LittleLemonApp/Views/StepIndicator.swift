//
//  StepIndicator.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-09.
//
import SwiftUI

struct StepIndicator: View {
    @Binding var currentStep:Int
    var body: some View {
        HStack {
            ForEach(0..<3) { step in
                Circle()
                    .fill(step == currentStep ? .primaryGreen : .secondaryGrayLight)
                    .frame(width: 12, height: 12)
                    .overlay(
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 2)
                    )
                    .padding(4)
            }
        }
    }
}
