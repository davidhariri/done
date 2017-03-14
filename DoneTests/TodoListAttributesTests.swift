//
//  TodoListDefaultAtrributeTests.swift
//  Done
//
//  Created by David Hariri on 2017-03-13.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class TodoListAttributesTests: XCTestCase {
    var todoList: TodoList!
    
    override func setUp() {
        super.setUp()
        todoList = TodoList()
    }
    
    override func tearDown() {
        super.tearDown()
        todoList = nil
    }
    
    func testThatEditingIsFalse() {
        XCTAssert(todoList.editing == false, ".editing was not false")
    }
    
    func testThatDoneMarkerIsTrue() {
        XCTAssert(todoList.doneMarker == true, ".doneMarker was not true")
    }
}
