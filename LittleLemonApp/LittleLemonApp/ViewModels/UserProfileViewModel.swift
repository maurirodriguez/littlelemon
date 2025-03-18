
//
//  ProfileViewModel.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-06.
//

import Foundation
import CoreData

class UserProfileViewModel: ObservableObject {
    
    let userManager = UserManager.shared
    @Published var isAuthenticated: Bool = UserManager.shared.isLoggedIn()
    @Published var user: User?
    
    func saveUser(_ user: User?) {
        if let user = user {
            userManager.saveUser(user)
        }
    }
    
    func loadUser() {
        user = userManager.getUser()
    }
    
    func logout() {
        userManager.logout()
        isAuthenticated = false
    }
    
    func login() {
        userManager.login()
        isAuthenticated = true
    }
    
 
    func  isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return email.range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
}
