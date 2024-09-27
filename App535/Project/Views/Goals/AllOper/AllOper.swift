//
//  AllOper.swift
//  App535
//
//  Created by IGOR on 24/09/2024.
//

import SwiftUI

struct AllOper: View {

    @StateObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
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
            }
            .padding()
        }
    }
}

#Preview {
    AllOper(viewModel: ProfileViewModel())
}
