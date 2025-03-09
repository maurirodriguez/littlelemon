//
//  Header.swift
//  LittleLemonApp
//
//  Created by Maurilio Rodriguez on 2025-03-05.
//

import SwiftUI

struct Header: View {
    
    @ObservedObject var userViewModel: UserProfileViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var showGoBackButton: Bool = false
    var isUserProfileActive: Bool
    
    var body: some View {
 
        NavigationStack{
            
            NavigationBar {
                Image("Logo")
            } leading: {
                HStack{
                    if(showGoBackButton){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.backward.circle.fill")
                                .foregroundColor(.primaryGreen)
                                .font(.system(size: 30))
                                .padding(.trailing)
                        }
                    }
                    
                    Spacer()
                }
                
            } trailing: {
                
                HStack {
                    Spacer()
                    if userViewModel.isAuthenticated  {
                        NavigationLink(destination: UserProfileView(userViewModel: userViewModel, showGoBackButton: true)) {
                            
                            Image("profile-image")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 50)
                                .clipShape(Circle())
                                .padding(.trailing)
                        }
                        .disabled(isUserProfileActive)
                        
                    }
                }
            }
        }
      
    }
}

#Preview {
    Header(userViewModel: UserProfileViewModel(), showGoBackButton: false, isUserProfileActive: false)
}
