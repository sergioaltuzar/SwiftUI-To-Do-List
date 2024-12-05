//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import SwiftUI

struct NewItemView: View {
  @StateObject var viewModel = NewItemViewModel()
  @Binding var newItemPresented: Bool
  
  var body: some View {
    VStack {
      Text("New Item")
        .font(.system(size: 32))
        .bold()
        .padding(.top, 100)
      Form {
        //title
        TextField("Title", text: $viewModel.title)
          .textFieldStyle(DefaultTextFieldStyle())
        //due date
        DatePicker("Due Date", selection: $viewModel.dueDate)
          .datePickerStyle(GraphicalDatePickerStyle())
        
        // button
        TLButton(tittle: "Save",
                 background: .pink)
        {
          if viewModel.canSave {
            viewModel.save()
            newItemPresented = false
          } else {
            viewModel.showAlert = true
          }
        }
        .padding()
      }
      .alert(isPresented: $viewModel.showAlert) {
        Alert(title: Text("Error"), message: Text("Please fill in all fields ans select due date that is today or newer."))
      }
    }
  }
}

#Preview {
  NewItemView(newItemPresented: Binding(get: {
    return true
  }, set: { _ in
    
  }))
}
