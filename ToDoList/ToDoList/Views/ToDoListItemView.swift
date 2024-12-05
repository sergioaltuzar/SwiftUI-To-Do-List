//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import SwiftUI

struct ToDoListItemView: View {
  @StateObject var viewModel = ToDoListItemViewModel()
  let item: ToDoListItem
    var body: some View {
      HStack {
        VStack(alignment: .leading) {
          Text(item.title)
            .font(.body)
          Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
            .font(.footnote)
            .foregroundColor(.gray)
        }
        Spacer()
        
        Button {
          viewModel.toggleIsDone(item: item)
        } label: {
          Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            .foregroundColor(.blue)
        }

      }
    }
}

#Preview {
  ToDoListItemView(item: .init(id: "123", title: "ir por huevos", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
