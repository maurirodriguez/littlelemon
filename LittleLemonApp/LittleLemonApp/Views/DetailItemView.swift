//
//  DetailItemView.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-03.
//


import SwiftUI

struct DetailItemView: View {
    
    @ObservedObject var userViewModel: UserProfileViewModel
    let dish: Dish
    
    var body: some View {
        VStack{
            Header(userViewModel: userViewModel, showGoBackButton: true, isUserProfileActive: false)
            ScrollView {
                AsyncImage(url: URL(string: dish.image ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Rectangle())
                .frame(minHeight: 150)
                
                VStack(alignment: .leading){
                
                        Text(dish.title)
                            .font(.cardTitle())
                            .foregroundColor(.primary)
                        Spacer()
                        Text(dish.category ?? "")
                        .font(.paragraphText())
                        .foregroundColor(.secondarySaumon)
                            .textCase(.uppercase)
                  
                    Spacer(minLength: 20)
                    Text(dish.comments ?? "")
                        .font(.highlightText())
                        .foregroundColor(.secondaryBlack)
                    Spacer(minLength: 20)
                    Text("$" + (dish.price ?? "0.0"))
                        .font(.highlightText())
                        .foregroundColor(.secondaryBlack)
                        .monospaced()
                    
                }
                .cornerRadius(10)
                .padding(25)
                
                
                Spacer()
            }
            .frame(maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DetailItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailItemView(userViewModel: UserProfileViewModel(), dish: PersistenceManager.shared.sampleDish())
    }
}
