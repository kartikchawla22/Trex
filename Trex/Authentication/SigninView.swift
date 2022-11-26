//
//  SigninView.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-12.
//

import SwiftUI

struct SigninView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var heading = "Welcome"
   
  
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            WelcomeTextView(text: $heading)
            LogoImageView()
            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(5.0)
            }.padding(.bottom, 75)
            Button(action: {
                if(email.isEmpty || password.isEmpty){
                    viewModel.errorMessage = "Both Fields are Mandatory"
                    viewModel.showAlert = true
                }else {
                viewModel.signIn(email: email, password: password)
                    
                }
               
            }, label: {
                Text("Sign In")
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
            NavigationLink("Create Account", destination: SignupView())
                .padding()
                .padding(.bottom, 15)
            NavigationLink("Forgot Password", destination: SignupView())
                .padding()
        }.padding(10)
        
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
