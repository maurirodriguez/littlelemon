//
//  NameStepView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-08.
//


import SwiftUI

struct NameStepView: View {
    @Binding var firstname: String
    @Binding var lastname: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your name")
                .font(.sectionCategory())
            Spacer(minLength: 30)
            Text("Firstname")
                .font(.highlightText())
                .foregroundColor(.primaryGreen)
            TextField("Firstname", text: $firstname)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.paragraphText())
            
            Text("Lastname")
                .font(.highlightText())
                .foregroundColor(.primaryGreen)
            TextField("Lastname", text: $lastname)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.paragraphText())
            
            if firstname.isEmpty || lastname.isEmpty {
                Text("Both fields are required.")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
