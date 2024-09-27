//
//  ContentView.swift
//  App535
//
//  Created by IGOR on 23/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
                
                if viewModel.isGoalReady {
                    
                    ProfileView()

                } else {
                    
                    if viewModel.isProfileReady {
                        
                        CreateView()
                        
                    } else {
                        
                        AddProfile()
                    }

                }
                
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
