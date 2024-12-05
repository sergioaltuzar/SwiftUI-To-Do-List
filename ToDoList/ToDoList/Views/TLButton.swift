//
//  TLButton.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import SwiftUI

struct TLButton: View {
  
  let tittle: String
  let background: Color
  let action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: 10)
          .foregroundColor(background)
        
        Text (tittle)
          .foregroundColor(.white)
          .bold()
      }
    }
  }
}

#Preview {
  TLButton(tittle: "Title", background: .blue) {
    //action
  }
}
