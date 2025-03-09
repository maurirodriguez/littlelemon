//
//  DishViewModel.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

import Foundation
import CoreData

class DishViewModel: ObservableObject {
    @Published var dishes: [Dish] = []
    @Published var searchQuery = ""
    @Published var selectedCategory: String? = nil
    
    private let apiService = APIService()
    private let context = PersistenceManager.shared.container.viewContext
    
    func fetchDishes() {
        apiService.fetchMenuItems { [weak self] fetchedItems in
            let storedDishes = self?.loadDishesFromCoreData() ?? []
            for item in fetchedItems where !storedDishes.contains(where: { $0.title == item.title }) {
                PersistenceManager.shared.saveDish(item, context: self!.context)
            }
            self?.dishes = self?.loadDishesFromCoreData() ?? []
        }
    }
    
    private func loadDishesFromCoreData() -> [Dish] {
        let request: NSFetchRequest<DishEntity> = DishEntity.fetchRequest()
        let storedDishes = (try? context.fetch(request)) ?? []
        return storedDishes.map { Dish(title: $0.title!, price: $0.price, image: $0.image, category: $0.category, comments: $0.comments)  }
    }
    
    var filteredDishes: [Dish] {
        dishes.filter {
            (searchQuery.isEmpty || $0.title.localizedCaseInsensitiveContains(searchQuery)) &&
            (selectedCategory == nil || $0.category == selectedCategory)
        }
    }
}
