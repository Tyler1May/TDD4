//
//  TodoViewModel.swift
//  SwiftUITodoWalkthrough
//
//  Created by Everett Brothers on 2/1/24.
//

import Foundation

class TodoViewModel: ObservableObject {
    static let shared = TodoViewModel()
    
    @Published var todoSections: [TodoSection]
    
    init(todoSections: [TodoSection] = []) {
        self.todoSections = todoSections
    }
    
    func delete(at offsets: IndexSet, from section: TodoSection) {
        for i in offsets {
            var index = todoSections.firstIndex(where: { $0.id == section.id })!
            todoSections[index].todos.remove(at: i)
        }
    }
    
    func addSection(_ section: TodoSection) {
        todoSections.append(section)
    }
    
    func toggleComplete(_ todo: Todo) {
        for section in todoSections {
            if section.todos.contains(where: { $0.id == todo.id }) {
                let i = todoSections.firstIndex(where: { $0.id == section.id })!
                let index = section.todos.firstIndex(where: { $0.id == todo.id })!
                todoSections[i].todos[index].markedComplete.toggle()
            }
        }
    }
}
