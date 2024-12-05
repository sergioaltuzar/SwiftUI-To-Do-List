//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

/// ViewModel for single to do list item view (each row in items list)

class ToDoListItemViewModel: ObservableObject {
  init() {}
  
  func toggleIsDone(item: ToDoListItem) {
    var itemCopy = item
    itemCopy.setDone(!item.isDone)
    
    guard let uid = Auth.auth().currentUser?.uid else {
      return
    }
    
    let db = Firestore.firestore()
    db.collection("users")
      .document(uid)
      .collection("todos")
      .document(itemCopy.id)
      .setData(itemCopy.asDictionary())
    
  }
}
