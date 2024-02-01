//
//  SwiftUITodoWalkthroughTests.swift
//  SwiftUITodoWalkthroughTests
//
//  Created by Everett Brothers on 2/1/24.
//

import XCTest
import SwiftUI
@testable import SwiftUITodoWalkthrough

final class SwiftUITodoWalkthroughTests: XCTestCase {

    var viewModel: TodoViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = TodoViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testTodoViewModel() {
        XCTAssertTrue(viewModel != nil)
    }
    
    func testDeleteTodoItem() {
        let initialSection = TodoSection(sectionTitle: "Test", todos: [Todo(markedComplete: false, title: "TestTodo1"), Todo(markedComplete: false, title: "TestTodo2")])
        viewModel.todoSections = [initialSection]
        viewModel.delete(at: [0], from: initialSection)
        
        XCTAssertEqual(viewModel.todoSections.first!.todos.count, 1)
    }
    
    func testAddSection() {
        let newSection = TodoSection(sectionTitle: "New Section", todos: [])
        
        viewModel.addSection(newSection)
        
        XCTAssertTrue(viewModel.todoSections.contains(where: { $0.sectionTitle == "New Section" }))
    }
    
    func testToggleComplete() {
        let todo = Todo(markedComplete: false, title: "TestTodo1")
        let section = TodoSection(sectionTitle: "Test", todos: [todo, Todo(markedComplete: false, title: "TestTodo2")])
        
        viewModel.todoSections = [section]
        viewModel.toggleComplete(todo)
        
        XCTAssertTrue(viewModel.todoSections[0].todos[0].markedComplete)
    }
    
    func testAddSectionView() {
        let sectionView = AddSectionView()
        
        let body = sectionView.body
        
        XCTAssertNotNil(body)
    }

}
