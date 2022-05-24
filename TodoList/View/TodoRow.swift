//
//  TodoRow.swift
//  TodoList
//
//  Created by Robert on 5/23/22.
//

import SwiftUI

struct TodoRow: View {
    var todo: Todo
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(todo.isCompleted ? .blue : .black)
            Text(todo.title)
            Spacer()
        }
        .padding(.horizontal, 10)
        
    }
}

struct TodoRow_swift_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodoRow(todo: Todo(title: "Cake"))
            TodoRow(todo: Todo(title: "Cake", isCompleted: true))
        }
        .previewLayout(.fixed(width: 300, height: 44))
    }
}
