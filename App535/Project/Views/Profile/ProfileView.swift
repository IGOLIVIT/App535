//
//  ProfileView.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                
                Text("Profile")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 8)
                    
                    HStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isProfile = false
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
                
                VStack(spacing: 15) {
                    
                    Image(viewModel.photo)
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text(viewModel.name)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                    
                }
                .padding(40)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 17).fill(.white).shadow(color: .gray.opacity(0.3), radius: 6))
                .padding(6)
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isSettings = true
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "gear")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Settings")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.3), radius: 4).padding(4))
                })
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isSettings, content: {
            
            SettingsView()
        })
    }
}

#Preview {
    ProfileView()
}
