//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import FirebaseFirestore
import Foundation
/// ViewModel for list of item view
/// Primary tab

class ToDoListViewModel: ObservableObject {
  @Published var showingNewItemView = false
  
  private let userId: String
  
  init(userId: String) {
    self.userId = userId
  }
  
  /// Delete to do list item
  /// - Parameter id: item id to delete
  func delete(id: String) {
    let db = Firestore.firestore()
    
    db.collection("users")
      .document(userId)
      .collection("todos")
      .document(id)
      .delete()
  }
}
