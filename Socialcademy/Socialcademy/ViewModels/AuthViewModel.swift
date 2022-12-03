//
//  AuthViewModel.swift
//  Socialcademy
//
//  Created by Robert Bates on 12/2/22.
//

import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var isAuthenticated = false
    
    @Published var email = ""
    
    @Published var password = ""

    private let authService = AuthService()
    
    init() {
        authService.$isAuthenticated.assign(to: &$isAuthenticated)
    }
    
    func signIn() {
        Task {
            do {
                try await authService.signIn(email: email, password: password)
            } catch {
                print("[AuthViewModel] Cannot sign in: \(error)")
            }
        }
    }
}
