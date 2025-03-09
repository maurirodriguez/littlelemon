//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-02-28.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    @StateObject private var userViewModel = UserProfileViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            if userViewModel.isAuthenticated {
                HomeView(userViewModel: userViewModel)
            } else {
                OnboardingView(userViewModel: userViewModel)
            }
            
        }
    }
}
