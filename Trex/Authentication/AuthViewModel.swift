//
//  AuthViewModel.swift
//  Trex
//
//  Created by Kartik Chawla on 2022-11-11.
//

import FirebaseAuth
import Foundation
import SwiftUI

/// This class handles the login and signup process
class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var signedIn = false
    @Published var showAlert = false
    @Published var errorMessage = ""

    var isSignedIn: Bool {
        return auth.currentUser != nil
    }

    /// This function acceps the email and password as params and check if user is authorized to singin or not
    func signIn(email: String, password: String) {
        if showAlert == true {
            return
        }
        auth.signIn(withEmail: email,
                    password: password) { [weak self] result, error in
            if result != nil && error == nil {
                DispatchQueue.main.async {
                    // Success
                    self?.signedIn = true
                }
            } else {
                if let x = error {
                    self?.errorMessage = String(x.localizedDescription)
                    self?.showAlert = true
                    print("unknown error: \(String(describing: self?.errorMessage))")
                }
            }
        }
    }

    /// This function acceps the email and password as params and check if user is able to signup or not
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                if let x = error {
                    self?.errorMessage = String(x.localizedDescription)
                    self?.showAlert = true
                    print("unknown error: \(String(describing: self?.errorMessage))")
                }
                return
            }
            DispatchQueue.main.async {
                // Success
                self?.signedIn = true
            }
        }
    }

    func getUser() -> User {
        return auth.currentUser!
    }

    func signOut() {
        try? auth.signOut()
        signedIn = false
    }
}
