//
//  APIService.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

import Foundation


class APIService {
    func fetchMenuItems(completion: @escaping ([MenuItem]) -> Void) {
       
        guard let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json") else { return }
                
          URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        print("Error fetching dishes: \(error?.localizedDescription ?? "Unknown error")")
                        completion([])
                        return
                    }
                    
                    do {
                        let menuList = try JSONDecoder().decode(MenuList.self, from: data)
                       
                        DispatchQueue.main.async {
                            completion(menuList.menu)
                        }
                    } catch {
                        print("Failed to decode JSON: \(error.localizedDescription)")
                        completion([])
                    }
          }.resume()
        
    }
}
