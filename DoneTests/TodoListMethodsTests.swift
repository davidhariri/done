//
//  TodoListDefaultAtrributeTests.swift
//  Done
//
//  Created by David Hariri on 2017-03-13.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class TodoListMethodsTests: XCTestCase {
    var todo: Todo!
    var todoList: TodoList!
    
    override func setUp() {
        super.setUp()
        todo = Todo(withText: "Test Item")
        todoList = TodoList()
        todoList.add(todo: todo)
    }
    
    override func tearDown() {
        super.tearDown()
        todo = nil
        todoList = nil
    }
    
    func testThatAddAddsATodo() {
        todoList.add(todo: todo)
        XCTAssert(todoList.length == 2, ".length was not 2. Got \(todoList.length)")
        XCTAssert(todoList.items[0].text == todo.text, ".items[0] was not todo")
    }
    
    func testThatRemoveRemovesATodo() {
        todoList.add(todo: Todo(withText: "Test Item 2"))
        todoList.remove(atIndex: 1)
        XCTAssert(todoList.length == 1, ".length was not 1. Got \(todoList.length)")
        XCTAssert(todoList.items[0].text == "Test Item 2", ".text was not 'Test Item 2'. Got '\(todoList.items[0].text)'")
    }
    
    func testThatRemoveSelectedRemovesSelectedTodos() {
        todo.toggleSelected()
        todoList.add(todo: Todo(withText: "Test Item 2"))
        XCTAssert(todoList.length == 2, ".length was not 2")
        todoList.removeSelected()
        XCTAssert(todoList.length == 1, ".length was not 1")
    }
    
    func testThatUpdateSelectedDoneMarksSelectedTodosDone() {
        let todo2 = Todo(withText: "Test Item 2")
        todo2.toggleSelected()
        todoList.add(todo: todo2)
        todoList.updateSelectedDone()
        XCTAssert(todo2.done, ".done was not true")
    }
}
