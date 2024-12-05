//
//  RegisterView.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import SwiftUI

struct RegisterView: View {
  
  @StateObject var viewModel = RegisterViewModel()
  
  var body: some View {
    VStack {
      // Header
      HeaderView(title: "Register", subtitle: "Start organizing ToDoS", angle: -15, background: .orange)
      
      Form {
        TextField("Full Name", text: $viewModel.name)
          .textFieldStyle(DefaultTextFieldStyle())
          .autocorrectionDisabled()
        
        TextField("Email Address", text: $viewModel.email)
          .textFieldStyle(DefaultTextFieldStyle())
          .autocapitalization(.none)
          .autocorrectionDisabled()
        
        SecureField("Password", text: $viewModel.password)
          .textFieldStyle(DefaultTextFieldStyle())
        
        TLButton(tittle: "Create Account", background: .green) {
          // Attemp Registration
          viewModel.register()
        }
        .padding()
      }
      .offset(y: -50)
      Spacer()
    }
  }
}

#Preview {
  RegisterView()
}
