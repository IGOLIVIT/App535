//
//  SettingsView.swift
//  App535
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {

    @StateObject var viewModel = ProfileViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isSettings = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Rate app")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.3), radius: 4).padding(4))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/2982ccab-a55a-4e07-b757-1c365e4963c2") else { return }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.3), radius: 4).padding(4))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
