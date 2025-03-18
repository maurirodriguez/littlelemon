//
//  HomeView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-02.
//

import SwiftUI

struct HomeView: View {
    
 
    @ObservedObject var userViewModel: UserProfileViewModel
    var body: some View {
    
        TabView {
            MenuView(userViewModel: userViewModel)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
              
            UserProfileView(userViewModel: userViewModel, showGoBackButton: false)
                .tabItem {
                    Image(systemName: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: .constant(!userViewModel.isAuthenticated)) {
            OnboardingView(userViewModel: userViewModel)
         }
    }
}

#Preview {
    HomeView(userViewModel: UserProfileViewModel())
}
