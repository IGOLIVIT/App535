//
//  EditGoal.swift
//  App535
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct EditGoal: View {
    
    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(viewModel.selectedGoal?.gName ?? "")
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
                        
                        Menu(content: {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isDelete = true
                                }
                                
                            }, label: {
                                
                                Text("Delete")
                                    .foregroundColor(.red)
                            })
                            
                        }, label: {
                            
                            Text("...")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        })
                    }
                }
                .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                                                
                            VStack {
                                
                                HStack {
                                    
                                    Text(viewModel.selectedGoal?.gName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 22, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Image(viewModel.selectedGoal?.gIcon ?? "")
                                        .renderingMode(.template)
                                        .foregroundColor(Color("\(viewModel.selectedGoal?.gColor ?? "")"))
                                }
                                
                                HStack {
                                    
                                    Text("$ \(viewModel.selectedGoal?.gSBalance ?? "") \(Text("/\(viewModel.selectedGoal?.gGoal ?? "")").foregroundColor(.gray).font(.system(size: 15, weight: .medium)))")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Spacer()
                                }
                                
                                GeometryReader { reader in
                                    
                                    let result = CGFloat((CGFloat(Int(viewModel.selectedGoal?.gSBalance ?? "") ?? 0) * reader.size.width)) / CGFloat(Int(viewModel.selectedGoal?.gGoal ?? "") ?? 1)
                                    
                                    ZStack(alignment: .leading, content: {
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(.gray.opacity(0.2))
                                            .frame(width: reader.size.width, height: 4)
                                        
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("\(viewModel.selectedGoal?.gColor ?? "")"))
                                            .frame(width: result, height: 4)
                                    })
                                }
                                .frame(height: 10)
                                
                                HStack {
                            
                                    ForEach(viewModel.addTypes, id: \.self) { index in
                                    
                                        Button(action: {
                                            
                                            viewModel.currentAddType = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isEdit = true
                                            }
                                            
                                        }, label: {
                                            
                                            Text(index)
                                                .foregroundColor(index == "Top up" ? .green : .red)
                                                .font(.system(size: 15, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 50)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(index == "Top up" ? .green.opacity(0.2) : .red.opacity(0.2)))
                                        })
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.2), radius: 6))
                            .padding(3)
                    }
                    
                    HStack {
                        
                        Text("History")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isSeeAll = true
                                
                            }
                            
                        }, label: {
                                                            
                                Text("See all >")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 10, weight: .regular))
                                    .padding(3)
                                    .padding(.horizontal, 3)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.2)))
                        })
                    }
                    
                    ForEach(viewModel.operations.filter{($0.opGoal ?? "") == viewModel.selectedGoal?.gName ?? ""}, id: \.self) { index in
                    
                        VStack(spacing: 20) {
                            
                            HStack {
                                
                                Text("\((index.opDate ?? Date()).convertDate(format: "dd.MM.YYYY"))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text("\((index.opDate ?? Date()).convertDate(format: "hh:MM"))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            
                            if index.opType == "Top up" {
                                
                                Text("+\(index.opSum) $")
                                    .foregroundColor(.green)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            } else {
                                
                                Text("-\(index.opSum) $")
                                    .foregroundColor(.red)
                                    .font(.system(size: 18, weight: .semibold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(color: .gray.opacity(0.3), radius: 5))
                        .padding(5)
                        
                    }
                }
                
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isEdit ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isEdit = false
                        }
                    }
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.white.opacity(0.1))
                        .frame(width: 40, height: 3)
                    
                    if viewModel.currentAddType == "Top up" {
                        
                        HStack {
                            
                            Image(systemName: "arrow.up")
                                .foregroundColor(.green)
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Top up")
                                .foregroundColor(.green)
                                .font(.system(size: 16, weight: .medium))
                                .padding()
                            
                            Spacer()
                            
                        }
                        
                    } else {
                        
                        HStack {
                            
                            Image(systemName: "arrow.down")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .medium))
                            
                            Text("Withdraw")
                                .foregroundColor(.red)
                                .font(.system(size: 16, weight: .medium))
                                .padding()
                            
                            Spacer()
                            
                        }
                        
                    }

                    VStack(spacing: 12) {
                                                    
                            VStack(alignment: .leading) {

                                ZStack(alignment: .leading, content: {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.opSum.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.opSum)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                                
                            }

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.opType = viewModel.currentAddType
                            
                            viewModel.opGoal = viewModel.selectedGoal?.gName ?? ""
                            
                            if viewModel.currentAddType == "Top up" {
                                
                                viewModel.gNewBalance = String("\(resultPlus)")
                                
                            } else {
                                
                                viewModel.gNewBalance = String("\(resultMinus)")
                                
                            }
                            
                            viewModel.addOper()
                            
                            viewModel.opSum = ""
                            
                            viewModel.fetchOper()
                            
                            CoreDataStack.shared.updateGoal(withgName: viewModel.selectedGoal?.gName ?? "", gNewBalance: viewModel.gNewBalance)
                            
                            viewModel.fetchGoalss()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEdit = false
                            }
                            
                        }, label: {
                            
                            Text("Confirm")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isEdit = false
                            }
                            
                        }, label: {
                            
                            Text("Cancel")
                                .foregroundColor(.red)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.red.opacity(0.1)))
                        })
                    }
                    .padding(.bottom, 60)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .offset(y: viewModel.isEdit ? 0 : UIScreen.main.bounds.height)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()

            }
        )
        .onAppear {
            
            viewModel.fetchOper()
        }
        .sheet(isPresented: $viewModel.isSeeAll, content: {
            
            AllOper(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
               
                        CoreDataStack.shared.deleteGoal(withGName: viewModel.selectedGoal?.gName ?? "", completion: {
                            
                            viewModel.fetchGoalss()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
    
    var resultMinus: Int {
        let numberFromString = Int(viewModel.selectedGoal?.gSBalance ?? "") ?? 0 
        return numberFromString - (Int(viewModel.opSum) ?? 0)
    }
    
    var resultPlus: Int {
        let numberFromString = Int(viewModel.selectedGoal?.gSBalance ?? "") ?? 0
        return numberFromString + (Int(viewModel.opSum) ?? 0)
    }
}

#Preview {
    EditGoal(viewModel: ProfileViewModel())
}
