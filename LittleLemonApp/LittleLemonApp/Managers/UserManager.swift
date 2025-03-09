//
//  UserManager.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    
    let kFirstname: String = "kFirstname"
    let kLastname: String = "kLastname"
    let kEmail: String = "kEmail"
    let kIsLoggedIn = "kIsLoggedIn"
    
    let kOrderStatus = "kOrderStatuses"
    let kPasswordChanges = "kPasswordChanges"
    let kSpecialOffers = "kSpecialOffers"
    let kNewsletter = "kNewsletter"
      
    
    private init() {}
    
    func saveUser(_ user: User) {
        if user.firstName.count > 0 {
            UserDefaults.standard.set(user.firstName, forKey: kFirstname)
        }
        
        if user.lastName.count  > 0 {
            UserDefaults.standard.set(user.lastName, forKey: kLastname)
        }
        
        if user.email.count > 0 {
            UserDefaults.standard.set(user.email, forKey: kEmail)
        }
        
        UserDefaults.standard.set(user.orderStatus, forKey: kOrderStatus)
        UserDefaults.standard.set(user.passwordChanges, forKey: kPasswordChanges)
        UserDefaults.standard.set(user.specialOffers, forKey: kSpecialOffers)
        UserDefaults.standard.set(user.newsLetters, forKey: kNewsletter)
    }
    
    func getUser() -> User? {
        
        if let firstName = UserDefaults.standard.string(forKey: kFirstname),
           let lastName = UserDefaults.standard.string(forKey: kLastname),
           let email = UserDefaults.standard.string(forKey: kEmail){
           
            let orderStatus = UserDefaults.standard.bool(forKey: kOrderStatus)
            let passwordChanges = UserDefaults.standard.bool(forKey: kPasswordChanges)
            let specialOffers = UserDefaults.standard.bool(forKey: kSpecialOffers)
            let newsletter = UserDefaults.standard.bool(forKey: kNewsletter)
            
            let user = User(firstName: firstName, lastName: lastName, email: email, orderStatus: orderStatus, passwordChanges: passwordChanges, specialOffers: specialOffers, newsLetters: newsletter)
            
            return user
            
        }
      
         return nil
     }
     
     func hasSavedUser() -> Bool {
         return UserDefaults.standard.object(forKey: kFirstname) != nil
     }
    
    func login() {
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
    }
    
    func logout() {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
        UserDefaults.standard.removeObject(forKey: kFirstname)
        UserDefaults.standard.removeObject(forKey: kLastname)
        UserDefaults.standard.removeObject(forKey: kEmail)
        UserDefaults.standard.removeObject(forKey: kOrderStatus)
        UserDefaults.standard.removeObject(forKey: kPasswordChanges)
        UserDefaults.standard.removeObject(forKey: kSpecialOffers)
        UserDefaults.standard.removeObject(forKey: kNewsletter)
    }
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: kIsLoggedIn)
    }
}
