//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-02.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title : String
    let price: String
    let image: String
    let category: String
    let comments: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case image = "image"
        case category = "category"
        case comments = "description"
    }
}
