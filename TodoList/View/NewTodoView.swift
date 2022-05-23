//
//  NewTodoView.swift
//  TodoList
//
//  Created by Robert on 5/22/22.
//

import SwiftUI

struct NewTodoView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: NewTodoViewModel
    @State private var text: String = ""
    @ObservedObject private var keyboard = KeyboardResponder()
    var body: some View {
        VStack {
            Spacer()
            TextField("Enter name", text: $text)
            Spacer()
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                Button {
                    self.viewModel.addNewTodo(title: text)
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            
        }
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        .animation(.easeOut(duration: keyboard.duration)) // 3
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: NewTodoViewModel())
    }
}
