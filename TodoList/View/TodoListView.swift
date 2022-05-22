//
//  TodoListView.swift
//  ToDoList
//
//  Created by Robert on 5/21/22.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title)
            }
            .navigationTitle(Text("Todo list"))
        }.onAppear {
            viewModel.fetchTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = TodoListView()
        view.viewModel = TodoListViewModel(dataManager: MockDataManager())
        return view
    }
}
