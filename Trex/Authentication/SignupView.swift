//
//  SignupView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct SignupView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            LogoImageView()
            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))

                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))

                Button(action: {
                    if(email.isEmpty || password.isEmpty){
                        viewModel.errorMessage = "Both Fields are Mandatory"
                        viewModel.showAlert = true
                    }else {
                        viewModel.signUp(email: email, password: password)
                    }
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.blue)
                })
                .alert("Attention", isPresented: $viewModel.showAlert){
                    Button("OK"){ viewModel.errorMessage = ""
                        viewModel.showAlert = false
                    }
                }
            message:{
            Text(viewModel.errorMessage)
            }
            }
            .padding()
            .navigationTitle("Create Account")
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
