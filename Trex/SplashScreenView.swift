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
    let firestoreController = FireStoreController()
    var body: some View {
        if isMainViewActive {
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
                firestoreController.getTodayData { stepsData, _ in
                    if let _: [String: Any] = stepsData {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.isMainViewActive = true
                        }
                    } else {
                        let data = stepsDataType(date: Date.now.formatted(date: .complete, time: .omitted), steps: 0, goal: 5000)
                        firestoreController.saveData(data: data)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            self.isMainViewActive = true
                        }
                    }
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
