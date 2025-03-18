//
//  EmailStepView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-08.
//

import SwiftUI

struct EmailStepView: View {
    @Binding var email: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome to Little Lemon")
                .font(.sectionCategory())
            Spacer(minLength: 30)
            Text("Email")
                .font(.highlightText())
                .foregroundColor(.primaryGreen)
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.paragraphText())
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            if email.isEmpty {
                Text("Email is required")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
