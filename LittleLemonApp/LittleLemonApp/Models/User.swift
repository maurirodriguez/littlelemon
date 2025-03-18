//
//  User.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var orderStatus: Bool
    var passwordChanges: Bool
    var specialOffers: Bool
    var newsLetters: Bool
}
