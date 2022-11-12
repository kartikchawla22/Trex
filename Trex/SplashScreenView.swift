//
//  SplashScreenView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-11.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isMainViewActive = false
    @State private var size = 0.6
    @State private var opacity = 0.5
    var body: some View {
        if(isMainViewActive)
        {
            let viewModel = AuthViewModel()
            AuthView()
                .environmentObject(viewModel)
            
        } else {
            VStack {
                VStack {
                    Text("TREX")
                        .padding(.bottom, 20)
                        .font(.system(size: 50))
                        .bold(true)
                    Image("splash-screen-image")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.8
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isMainViewActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
