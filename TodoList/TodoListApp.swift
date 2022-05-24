//
//  TodoListApp.swift
//  TodoList
//
//  Created by Robert on 5/22/22.
//

import SwiftUI

@main
struct TodoListApp: App {
    let context = CoreDataHelper.shared.persistentContainer.viewContext
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environment(\.managedObjectContext, context)
        }
    }
}
