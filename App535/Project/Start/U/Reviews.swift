//
//  Reviews.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Reviews")
                    .resizable()
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 7)
                        .padding(.top, 25)
                    
                    Text("Help make the app even better")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding(.bottom, 30)
                }
                .padding()
                .frame(height: 290)
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
            .ignoresSafeArea()
        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews()
}
