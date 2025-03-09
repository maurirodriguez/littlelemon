//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

import SwiftUI

struct Hero: View {
    
    var body: some View {
        VStack {
            HStack (alignment: .bottom) {
                VStack {
                    Text("Little Lemon")
                        .foregroundColor(Color.primaryYellow)
                        .font(.displayTitle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Chicago")
                        .foregroundColor(.white)
                        .font(.displaySubtitle())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 5)
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.white)
                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
            .padding()
            
        }
        .background(.primaryGreen)
    }
}

struct Hero_Previews: PreviewProvider {
    static var previews: some View {
        Hero()
            .padding()
            .background(Color.primaryGreen)
            .frame(maxWidth: .infinity, maxHeight: 240)
    }
}
