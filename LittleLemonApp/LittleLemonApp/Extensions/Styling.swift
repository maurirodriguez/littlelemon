//
//  Styling.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-07.
//


import SwiftUI

struct CategoryButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .foregroundColor(.primaryGreen)
            .background(isEnabled ? Color.secondaryGrayLight : Color.secondarySaumonLight)
            .font(.sectionCategory())
            .clipShape(Capsule())
            
    }
}


struct YellowButtonWide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .primaryYellow : .primaryGreen)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryGreen : Color.primaryYellow)
            .cornerRadius(8)
            .padding(.horizontal)
            .font(.leadText())
           
    }
}

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .primaryGreen : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryGreen)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryGreen, lineWidth: 1)
            )
            .padding(.horizontal)
            .font(.paragraphText())
    }
}

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryGreen)
            .padding(10)
            .background(configuration.isPressed ?  Color.primaryGreen : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryGreen, lineWidth: 1)
            )
            .padding(.horizontal)
            .font(.paragraphText())
    }
}



struct CheckToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(configuration.isOn ? Color.primaryGreen : .secondaryGrayLight)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(.plain)
    }
}
