//
//  Not.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false

    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Not")
                    .resizable()
                    .padding(.top, 70)
                
                VStack {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 7)
                        .padding(.top, 25)
                    
                    Text("The newest information especially for you")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Text("Enable notification")
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
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.white))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    Not()
}
