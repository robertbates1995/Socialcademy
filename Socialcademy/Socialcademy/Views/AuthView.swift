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
        if viewModel.user != nil {
            MainTabView()
        } else {
            NavigationView {
                SignInForm(viewModel: viewModel.makeSignInViewModel()) {
                    NavigationLink("Create Account", destination: CreateAccountForm(viewModel: viewModel.makeCreateAccountViewModel()))
                }
            }
        }
    }
}

private extension AuthView {
    struct CreateAccountForm: View {
        @StateObject var viewModel: AuthViewModel.CreateAccountViewModel
        @Environment(\.dismiss) private var dismiss
        
        var body: some View {
            Form {
                TextField("Name", text: $viewModel.name)
                    .textContentType(.name)
                    .textInputAutocapitalization(.words)
                TextField("Email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)
                    .textContentType(.newPassword)
            } footer: {
                Button("Create Account", action: viewModel.submit)
                    .buttonStyle(.primary)
                Button("Sign In", action: dismiss.callAsFunction)
                    .padding()
            }
            .navigationTitle("Create Account")
            .onSubmit(viewModel.submit)
            .alert("Cannot Sign In", error: $viewModel.error)
            .disabled(viewModel.isWorking)
        }
    }
}

private extension AuthView {
    struct SignInForm<Footer: View>: View {
        @StateObject var viewModel: AuthViewModel.SignInViewModel
        @ViewBuilder let footer: () -> Footer
     
        var body: some View {
            VStack {
                Text("Socialcademy")
                    .font(.title.bold())
                Group {
                    TextField("Email", text: $viewModel.email)
                        .textContentType(.emailAddress)
                    SecureField("Password", text: $viewModel.password)
                        .textContentType(.password)
                }
                .padding()
                .background(Color.secondary.opacity(0.15))
                .cornerRadius(10)
                Button("Sign In", action: viewModel.submit)
                    .buttonStyle(.primary)
                footer()
                    .padding()
            }
            .navigationBarHidden(true)
            .onSubmit(viewModel.submit)
            .padding()
            .alert("Cannot Create Account", error: $viewModel.error)
            .disabled(viewModel.isWorking)
        }
    }
}

private extension AuthView {
    struct Form<Fields: View, Footer: View>: View {
        @ViewBuilder let fields: () -> Fields
        @ViewBuilder let footer: () -> Footer
        
        var body: some View {
            VStack {
                Text("Socialcademy")
                    .font(.title.bold())
                fields()
                    .padding()
                    .background(Color.secondary.opacity(0.15))
                    .cornerRadius(10)
                footer()
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
