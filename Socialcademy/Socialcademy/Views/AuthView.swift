//
//  AuthView.swift
//  Socialcademy
//
//  Created by Robert Bates on 12/2/22.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        if viewModel.isAuthenticated {
            MainTabView()
        } else {
            Form {
                TextField("Email", text: $viewModel.email)
                SecureField("Password", text: $viewModel.password)
                Button("Sign In", action: {
                    viewModel.signIn()
                })
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
