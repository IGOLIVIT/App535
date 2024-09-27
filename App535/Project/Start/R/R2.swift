//
//  R2.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color("prim")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("R2")
                    .resizable()
                    .padding(.top, 70)
                
                VStack {
                    
                    Text("Track your progress")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 7)
                        .padding(.top, 25)
                    
                    Text("Аnd get closer to your dream")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    }
}

#Preview {
    R2()
}
