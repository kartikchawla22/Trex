//
//  LoginView.swift
//  Trex
//
//  Created by Himanshu Vats on 2022-10-29.
//

import FirebaseAuth
import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var pedometerController = PedometerController()
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                HomeView().environmentObject(viewModel)
            }
            else {
                SigninView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(AuthViewModel())
    }
}
