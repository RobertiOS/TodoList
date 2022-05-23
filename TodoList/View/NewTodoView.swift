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
    
    private var isButtonDisabled: Bool {
        text.isEmpty
    }
    
    private var addButtonBackgroundColor: Color {
        isButtonDisabled ? .gray : .blue
    }
    
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
                .foregroundColor(.black)
                .cornerRadius(10)

                Button {
                    self.viewModel.addNewTodo(title: text)
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add")
                }
                .padding(.vertical, 16.0)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(addButtonBackgroundColor)
                .disabled(isButtonDisabled)
                .foregroundColor(.black)
                .cornerRadius(10)
            }
            
        }
        .padding()
        .padding(.bottom, keyboard.currentHeight)
        // TODO: Deprecated init
        .animation(.easeOut(duration: keyboard.duration))
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(viewModel: NewTodoViewModel())
    }
}
