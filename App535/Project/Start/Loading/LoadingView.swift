//
//  LoadingView.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
                    .padding(.top, 100)
                    .frame(maxHeight: .infinity)
                
                Image("lviews")
                    .resizable()
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoadingView()
}
