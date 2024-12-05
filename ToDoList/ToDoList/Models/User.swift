//
//  User.swift
//  ToDoList
//
//  Created by Sergio Luis Altuzar Morales on 28/11/24.
//

import Foundation

struct User: Codable {
  let id: String
  let name: String
  let email: String
  let joined: TimeInterval
}
