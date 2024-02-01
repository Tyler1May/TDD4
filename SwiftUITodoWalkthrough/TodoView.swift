//
//  TodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Brayden Lemke on 10/2/23.
//

import SwiftUI

struct TodoView: View {
    
    @ObservedObject var todoViewModel = TodoViewModel.shared
    
    var body: some View {
        NavigationStack {
            TodoListView(todoSections: $todoViewModel.todoSections)
                .navigationTitle("Todos")
                .toolbar {
                    NavigationLink {
                        AddSectionView()
                            .navigationTitle("Add Section")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
        }
    }
}

struct TodoListView: View {
    @Binding var todoSections: [TodoSection]
    var body: some View {
        VStack {
            List {
                ForEach($todoSections) { $section in
                    Section(section.sectionTitle) {
                        ForEach($section.todos) { $todo in
                            TodoRowView(todo: $todo)
                        }
                        .onDelete(perform: { indexSet in
                            TodoViewModel.shared.delete(at: indexSet, from: section)
                        })
                    }
                }
            }.listStyle(.inset)
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
