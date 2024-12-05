//
//  LoginView.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import SwiftUI

struct LoginView: View {
  
  @StateObject var viewModel = LoginViewModel()
  
    var body: some View {
      NavigationView {
        VStack {
          // Header
          HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
          
          // Login Form
          Form {
            if !viewModel.errorMessage.isEmpty {
              Text(viewModel.errorMessage)
                .foregroundColor(.red)
            }
            
            TextField("Email Address", text: $viewModel.email)
              .textFieldStyle(DefaultTextFieldStyle())
              .autocapitalization(.none)
              .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
              .textFieldStyle(DefaultTextFieldStyle())
            
            
            TLButton(tittle: "Log In", background: .blue) {
              viewModel.login()
            }
            .padding()
          }
          .offset(y: -50)
          // Create Account
          VStack {
            Text("New around here?")
            NavigationLink("Create An Account", destination: RegisterView())
          }
          .padding(.bottom, 50)
          Spacer()
        }
      }
    }
}

#Preview {
    LoginView()
}
