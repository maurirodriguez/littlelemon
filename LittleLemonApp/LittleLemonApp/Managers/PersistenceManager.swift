//
//  PersistenceManager.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

import CoreData

class PersistenceManager {
    static let shared = PersistenceManager()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ExampleDatabase")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func saveDish(_ item: MenuItem, context: NSManagedObjectContext) {
        let newDish = DishEntity(context: context)
        newDish.title = item.title
        newDish.image = item.image
        newDish.price = item.price
        newDish.category = item.category
        newDish.comments = item.comments
        
        try? context.save()
    }
    
    func removeAll() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
        
    }
    
    func sampleDish() -> Dish {
        
        return Dish(title:"Chicken Souvlaki", price: "15", image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true", category: "Main",comments: "Some description here")
    }
}
