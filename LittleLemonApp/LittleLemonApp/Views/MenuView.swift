//
//  MenuView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-02.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var userViewModel: UserProfileViewModel
    @StateObject var viewModel = DishViewModel()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                Header(userViewModel: userViewModel, showGoBackButton: false, isUserProfileActive: false)
                VStack{
                    Hero()
                  
                    TextField("🔎", text: $viewModel.searchQuery)
                    .textFieldStyle(.roundedBorder)
                  
                }
                .padding()
                .background(.primaryGreen)
                Text("ORDER FOR DELIVERY")
                    .font(.title2)
                    .padding(10)
                HStack{
                    Button("All", action: {
                        viewModel.selectedCategory = nil
                          })
                    .buttonStyle(CategoryButton())
                    
                    
                    Button("Starters", action: {
                        viewModel.selectedCategory = "starters"
                          })
                    .buttonStyle(CategoryButton())
                    .disabled(viewModel.selectedCategory == "starters")
                    
                    Button("Mains", action: {
                            viewModel.selectedCategory = "mains"
                          })
                    .buttonStyle(CategoryButton())
                    .disabled(viewModel.selectedCategory == "mains")
                    
                    Button("Desserts", action: {
                        viewModel.selectedCategory = "desserts"
                          })
                    .buttonStyle(CategoryButton())
                    .disabled(viewModel.selectedCategory == "desserts")
                    
                    Button("Drinks", action: {
                        viewModel.selectedCategory = "drinks"
                          })
                    .buttonStyle(CategoryButton())
                    .disabled(viewModel.selectedCategory == "drinks")
                }
                .padding(5)
                List(viewModel.filteredDishes){ dish in
                    NavigationLink(destination: DetailItemView(userViewModel: userViewModel, dish: dish)){
                        FoodItem(dish: dish)
                    }
                }
            }
        }
        .onAppear(){
            viewModel.fetchDishes()
        }
    }
    
   /* func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                  selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search/*, starters, mains, desserts, drinks*/])
        return compoundPredicate
    }*/
    
}

#Preview {
    MenuView(userViewModel: UserProfileViewModel())
}
