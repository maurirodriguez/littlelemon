//
//  Dish.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-06.
//

import Foundation

struct Dish: Identifiable {
    let id = UUID()
    let title : String
    let price: String?
    let image: String?
    let category: String?
    let comments: String?
}
