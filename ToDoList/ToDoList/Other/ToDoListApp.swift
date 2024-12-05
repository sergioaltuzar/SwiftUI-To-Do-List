//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
  init () {
    FirebaseApp.configure()
  }
    var body: some Scene {
        WindowGroup {
          MainView()
        }
    }
}
