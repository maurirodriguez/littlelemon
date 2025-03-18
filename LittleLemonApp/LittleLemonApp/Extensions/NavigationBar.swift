//
//  NavigationBar.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-08.
//

import SwiftUI

struct NavigationBar<Title: View, Leading: View, Trailing: View>: View {
    
   
    
    init(@ViewBuilder title: () -> Title, leading: () -> Leading = { EmptyView() }, trailing: () -> Trailing = { EmptyView() }) {
        self.title = title()
        self.leading = leading()
        self.trailing = trailing()
    }
    
    
    var title: Title
    var leading: Leading
    var trailing: Trailing
    
    
    
    var body: some View {
        ZStack {
            Color.white
            HStack(spacing: 0) {
                leading.padding()
                Spacer()
                trailing.padding()
            }
            HStack {
                title.padding()
            }
        }
        .foregroundStyle(Color.black)
        .frame(height: 50)
    }
    
}
