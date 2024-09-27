//
//  GoalsView.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("\(viewModel.name),")
                            .foregroundColor(.black)
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("Welcome!")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .medium))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isProfile = true
                        }
                        
                    }, label: {
                        
                        Image(viewModel.photo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                    })

                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.goals, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.selectedGoal = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDetail = true
                                }
                                
                            }, label: {
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        Text(index.gName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 22, weight: .semibold))
                                        
                                        Spacer()
                                        
                                        Image(index.gIcon ?? "")
                                            .renderingMode(.template)
                                            .foregroundColor(Color("\(index.gColor ?? "")"))
                                    }
                                    
                                    HStack {
                                        
                                        Text("$ \(index.gSBalance ?? "") \(Text("/\(index.gGoal ?? "")").foregroundColor(.gray).font(.system(size: 15, weight: .medium)))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Spacer()
                                    }
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(index.gSBalance ?? "") ?? 0) * reader.size.width)) / CGFloat(Int(index.gGoal ?? "") ?? 1)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.gray.opacity(0.2))
                                                .frame(width: reader.size.width, height: 4)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("\(index.gColor ?? "")"))
                                                .frame(width: result, height: 4)
                                        })
                                    }
                                    .frame(height: 10)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.2), radius: 6))
                                .padding(3)
                            })
                        }
                    }
                }
                
            }
            .padding()
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                        .padding()
                        .background(Circle().fill(Color("yellow")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoalss()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddGoal(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            EditGoal(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isProfile, content: {
            
            ProfileView()
        })
    }
}

#Preview {
    GoalsView()
}
