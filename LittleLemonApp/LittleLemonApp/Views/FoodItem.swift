//
//  FoodItem.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//


import SwiftUI

struct FoodItem: View {
 
    let dish:Dish
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategory())
                    .foregroundColor(.black)
                Spacer(minLength: 2)
                Text(dish.comments ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.secondaryBlack)
                    .lineLimit(2)
             
                Spacer(minLength: 5)
                Text("$" + (dish.price ?? "0.0"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryGreen)
                    .monospaced()
            }
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

struct FoodItem_Previews: PreviewProvider {
    
    static var previews: some View {
        FoodItem(dish: PersistenceManager.shared.sampleDish())
    }
    
}
