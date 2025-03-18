//
//  OnboardingView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-02.
//

import SwiftUI

struct OnboardingView: View {
    
    @ObservedObject var userViewModel: UserProfileViewModel
    
    @State private var currentStep = 0
    
    @State private var errorAlert = false
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var email: String = ""
    
    @State private var orderStatus: Bool = false
    @State private var passwordChanges: Bool = false
    @State private var specialOffers: Bool = false
    @State private var newsletter: Bool = false
    
    var body: some View {
        VStack{
            Header(userViewModel: userViewModel, showGoBackButton: false, isUserProfileActive: false)
            Hero()
                .frame(height: 250)
       
            VStack{
                TabView(selection: $currentStep){
                    
                    EmailStepView(email: $email)
                        .tag(0)
                       
                    NameStepView(firstname: $firstname, lastname: $lastname)
                        .tag(1)
                        
                    NotificationsStepView(orderStatus: $orderStatus, passwordChanges: $passwordChanges, specialOffers: $specialOffers, newsletter: $newsletter)
                        .tag(2)
                       
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .frame(height: 300)
            StepIndicator(currentStep: $currentStep)
               
            Spacer()
            Button(action: {
                if currentStep < 2 {
                    
                    if isValidInput() {
                        errorAlert = false
                        currentStep += 1
                    }else{
                        errorAlert = true
                    }
                } else {
                    loginUserAction()
                }
            }) {
                Text(currentStep == 2 ? "Login" : "Next")
                   
            }
            .alert(isPresented: $errorAlert) {
                Alert(title: Text("Invalid data detected"), message: Text("Please verify your information and try again"), dismissButton: .default(Text("OK")))
            }
            .buttonStyle(YellowButtonWide())
            
        }
        .padding()
         .fullScreenCover(isPresented: .constant(userViewModel.isAuthenticated)) {
             HomeView(userViewModel: userViewModel)
         }
    }
    

    private func loginUserAction() {
        
        if !firstname.isEmpty && !lastname.isEmpty
            && userViewModel.isValidEmail(email) {
           
            let user = User(firstName: firstname, lastName: lastname, email: email, orderStatus: false, passwordChanges: false, specialOffers: false, newsLetters: false)
             
            errorAlert = false
            
            userViewModel.saveUser(user)
            userViewModel.login()
            
        }else{
            errorAlert = true
        }
    }
    
    func isValidInput() -> Bool {
        switch currentStep {
           case 0:
               return userViewModel.isValidEmail(email)
           case 1:
               return !firstname.isEmpty && !lastname.isEmpty
           default:
               return false
           }
    }
    
}

#Preview {
    OnboardingView(userViewModel: UserProfileViewModel())
}
