//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import  FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var errorMessage = ""
  
  init() {}
  
  func login() {
    guard validate() else {
      return
    }
    
    // Try log in
    
    Auth.auth().signIn(withEmail: email, password: password)
  }
  
  private func validate() -> Bool {
    errorMessage = ""
    guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
          !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
      
      showError(message: "Please fill in all fields.")
      return false
    }
    
    //emailvalidation
    guard email.contains("@") && email.contains(".") else {
      showError(message: "Please enter a valid email.")
      return false
    }
    return true
  }
  
  private func showError(message: String) {
          errorMessage = message
          
          DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
              self.errorMessage = ""
          }
      }
}
