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
    
    private let authService = AuthService()
    
    init() {
        authService.$isAuthenticated.assign(to: &$isAuthenticated)
    }
}
