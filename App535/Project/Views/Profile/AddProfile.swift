//
//  AddProfile.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct AddProfile: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Welcome to Acoustify!")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 8)
                
                Text("Enter a name to continue")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .padding(.bottom, 80)
                
                Menu(content: {
                    
                    ForEach(viewModel.Photos, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.currentPhoto = index
                            
                        }, label: {
                            
                            Text(index)
                            
                            Image(index)
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.currentPhoto.isEmpty {
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .regular))
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(.black.opacity(0.8)))
                        
                    } else {
                        
                        Image(viewModel.currentPhoto)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                })
                
                
                ZStack(content: {
                    
                    Text("Name")
                        .foregroundColor(.gray)
                        .font(.system(size: 16, weight: .medium))
                        .opacity(viewModel.addName.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.addName)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .medium))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                
                Rectangle()
                    .fill(.gray.opacity(0.5))
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.name = viewModel.addName
                    viewModel.photo = viewModel.currentPhoto
                    
                    viewModel.isProfileReady = true
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                })
                
            }
            .padding()
        }
    }
}

#Preview {
    AddProfile()
}
