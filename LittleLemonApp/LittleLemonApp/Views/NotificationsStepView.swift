//
//  PrivacyPolicyStepView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-08.
//


import SwiftUI

struct NotificationsStepView: View {
    
    @Binding var orderStatus: Bool
    @Binding var passwordChanges: Bool
    @Binding var specialOffers: Bool
    @Binding var newsletter: Bool
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Email notifications")
                .font(.sectionCategory())
            Spacer(minLength: 30)
            VStack(alignment: .leading) {
                HStack{
                    Toggle("Order statuses", isOn: $orderStatus)
                        .font(Font.paragraphText())
                        .foregroundColor(.primaryGreen)
                        .toggleStyle(CheckToggle())
                    Spacer()
                }
                .padding(1)
                HStack{
                    Toggle("Password changes", isOn: $passwordChanges)
                        .font(Font.paragraphText())
                        .foregroundColor(.primaryGreen)
                        .toggleStyle(CheckToggle())
                    Spacer()
                }
                .padding(1)
                HStack{
                    Toggle("Special offers", isOn: $specialOffers)
                        .font(Font.paragraphText())
                        .foregroundColor(.primaryGreen)
                        .toggleStyle(CheckToggle())
                    Spacer()
                }
                .padding(1)
                HStack{
                    Toggle("Newsletter", isOn: $newsletter)
                        .font(Font.paragraphText())
                        .foregroundColor(.primaryGreen)
                        .toggleStyle(CheckToggle())
                    Spacer()
                }
                .padding(1)
                
            }
            Spacer()
        }
        .padding()
        
    }
}
