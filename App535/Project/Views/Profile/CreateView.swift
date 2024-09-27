//
//  CreateView.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct CreateView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Create a piggy bank")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                        
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                    }
                }
                    
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        VStack {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.gName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        VStack {
                            
                            Text("Goal")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("$")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gGoal.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.gGoal)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        VStack {
                            
                            Text("Starting balance")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ZStack(content: {
                                
                                Text("$ 0")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.gSBalance.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.gSBalance)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            VStack {
                                
                                Text("Color")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Menu(content: {
                                    
                                    ForEach(viewModel.Colors, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.currentColor = index
                                            
                                        }, label: {
                                            
                                            Text(index)
                                        })
                                    }
                                    
                                }, label: {
                                    
                                    Circle()
                                        .fill(Color(viewModel.currentColor))
                                        .frame(width: 40)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                })
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 110)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            
                            VStack {
                                
                                Text("Icon")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Menu(content: {
                                    
                                    ForEach(viewModel.Icons, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.currentIcon = index
                                            
                                        }, label: {
                                            
                                            Image(index)
                                        })
                                    }
                                    
                                }, label: {
                                    
                                    Image(viewModel.currentIcon)
                                        .renderingMode(.template)
                                        .foregroundColor(Color("\(viewModel.currentColor)"))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                })
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 110)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        }
                    }
                }
                
                Button(action: {
                    
                    viewModel.gColor = viewModel.currentColor
                    viewModel.gIcon = viewModel.currentIcon
                    
                    viewModel.addGoal()
                    
                    viewModel.gName = ""
                    viewModel.gGoal = ""
                    viewModel.gSBalance = ""
                    
                    viewModel.fetchGoalss()
                    
                    viewModel.isGoalReady = true
                    
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
    CreateView()
}
