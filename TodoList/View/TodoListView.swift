//
//  TodoListView.swift
//  ToDoList
//
//  Created by Robert on 5/21/22.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel = TodoListViewModel()
    @State var isShowingNewTodoView = false
    
    private var addnewButton: some View {
        Button {
            self.isShowingNewTodoView.toggle()
        } label: {
            Image(systemName: "plus")
        }
    }
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title)
            }
            .navigationTitle(Text("Todo list"))
            .navigationBarItems(trailing: addnewButton)
        }
        .onAppear {
            viewModel.fetchTodos()
        }
        .sheet(isPresented: $isShowingNewTodoView) {
            self.viewModel.fetchTodos()
        } content: {
            NewTodoView(viewModel: NewTodoViewModel())
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
