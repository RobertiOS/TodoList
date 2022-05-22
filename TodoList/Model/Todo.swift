//
//  Todo.swift
//  ToDoList
//
//  Created by Robert on 5/21/22.
//

import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted = false
}
