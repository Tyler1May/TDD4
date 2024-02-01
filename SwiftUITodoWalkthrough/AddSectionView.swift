//
//  AddSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Everett Brothers on 12/13/23.
//

import SwiftUI

struct AddSectionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var todoViewModel = TodoViewModel.shared
    @State var todos: [Todo] = []
    @State var title = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Text("Add Section")
                    .font(.title)
                
                TextField("Title:", text: $title)
                    .frame(width: 300)
                
                Spacer()
                
                if !todoViewModel.todoSections.isEmpty {
                    List {
                        ForEach(todos) { todo in
                            Text(todo.title)
                        }
                    }.listStyle(.inset)
                    .frame(maxHeight: 400)
                }
                
                Spacer()
                
                NavigationLink {
                    AddTodoView(todos: $todos)
                        .navigationTitle("Add Todo")
                } label: {
                    Text("Add Todo")
                }
                
                Spacer()
                
                Button {
                    todoViewModel.addSection(TodoSection(sectionTitle: title, todos: todos))
                    dismiss()
                } label: {
                    Text("Add")
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 100)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.blue)
                        )
                }
                
                Spacer()
            }
        }
    }
}

struct AddTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var todos: [Todo]
    @State var title = ""
    
    var body: some View {
        VStack {
            Spacer()
            TextField("Title:", text: $title)
                .frame(width: 300)
            Spacer()
            Button {
                todos.append(Todo(markedComplete: false, title: title))
                dismiss()
            } label: {
                Text("Add")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 100)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.blue)
                    )
            }
            Spacer()
        }
    }
}
