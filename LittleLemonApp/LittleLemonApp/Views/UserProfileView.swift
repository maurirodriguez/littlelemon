//
//  UserProfile.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-02.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var userViewModel: UserProfileViewModel
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @State private var orderStatus = true
    @State private var passwordChanges = true
    @State private var specialOffers = true
    @State private var newsletter = true
      
    @State  var showGoBackButton:Bool
    @State var errorAlert: Bool = false
      
  
    var body: some View {
        NavigationStack{
            Header(userViewModel: userViewModel, showGoBackButton: showGoBackButton, isUserProfileActive: true)
            ScrollView(.vertical,  showsIndicators: false) {
                
                VStack(spacing: 5) {
                    VStack(alignment: .leading) {
                        Text("Personal Information")
                            .font(.sectionCategory())
                        Spacer(minLength: 5)
                        Text("Avatar")
                            .font(.highlightText())
                            .foregroundStyle(.primaryGreen)
                        HStack(spacing: 0) {
                            Image("profile-image")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 75)
                                .clipShape(Circle())
                                .padding(.trailing)
                            Button("Change") { }
                                .buttonStyle(GreenButton())
                            Button("Remove") { }
                                .buttonStyle(GrayButton())
                            Spacer()
                        }
                    }
                    Spacer(minLength: 5)
                    VStack(alignment: .leading){
                        Text("Firstname")
                            .font(.highlightText())
                            .foregroundStyle(.primaryGreen)
                        TextField("Firstname", text: $firstName)
                            .font(.paragraphText())
                    }
                    Spacer(minLength: 5)
                    VStack(alignment: .leading) {
                        Text("Lastname")
                            .font(.highlightText())
                            .foregroundStyle(.primaryGreen)
                        TextField("Lastname", text: $lastName)
                            .font(.paragraphText())
                        
                    }
                    Spacer(minLength: 5)
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.highlightText())
                            .foregroundStyle(.primaryGreen)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .font(.paragraphText())
                    }
                    
                    
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
                VStack(alignment: .leading){
                    Text("Email notifications")
                        .font(.sectionCategory())
                    Spacer(minLength: 5)
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
              
               
                HStack {
                    Button("Discard Changes") {
                        firstName = userViewModel.user?.firstName ?? ""
                        lastName = userViewModel.user?.lastName ?? ""
                        email = userViewModel.user?.email ?? ""
                        
                        orderStatus = userViewModel.user?.orderStatus ?? false
                        passwordChanges = userViewModel.user?.passwordChanges ?? false
                        specialOffers = userViewModel.user?.specialOffers ?? false
                        newsletter = userViewModel.user?.newsLetters ?? false
                        
                    }
                    .buttonStyle(GrayButton())
                    Button("Save changes") {
                        if isValidInput() {
                            errorAlert = false
                            let user = User(firstName: firstName, lastName: lastName, email: email, orderStatus: orderStatus, passwordChanges: passwordChanges, specialOffers: specialOffers, newsLetters: newsletter)
                            
                            userViewModel.saveUser(user)
                            userViewModel.loadUser()
                        }else{
                            errorAlert = true
                        }
                    }
                    .alert(isPresented: $errorAlert) {
                        Alert(title: Text("Invalid data detected"), message: Text("Please verify your information and try again"), dismissButton: .default(Text("OK")))
                    }
                    .buttonStyle(GreenButton())
                }
                Spacer(minLength: 20)
                Button("Log out") {
                    userViewModel.logout()
                }
                .buttonStyle(YellowButtonWide())
             
            }
          }
          .onAppear {
              userViewModel.loadUser()
              
              firstName = userViewModel.user?.firstName ?? ""
              lastName = userViewModel.user?.lastName ?? ""
              email = userViewModel.user?.email ?? ""
              
              orderStatus = userViewModel.user?.orderStatus ?? false
              passwordChanges = userViewModel.user?.passwordChanges ?? false
              specialOffers = userViewModel.user?.specialOffers ?? false
              newsletter = userViewModel.user?.newsLetters ?? false
          }
          .navigationBarBackButtonHidden(true)
          .fullScreenCover(isPresented: .constant(!userViewModel.isAuthenticated)) {
              OnboardingView(userViewModel: userViewModel)
          }
      }
    
        func isValidInput() -> Bool {
           return userViewModel.isValidEmail(email)
                   && !firstName.isEmpty && !lastName.isEmpty
        }
}

#Preview {
    UserProfileView(userViewModel: UserProfileViewModel(), showGoBackButton: false)
}
