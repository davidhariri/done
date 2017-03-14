//
//  TodoMethodTests.swift
//  Done
//
//  Created by David Hariri on 2017-03-10.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class TodoAttributesTests: XCTestCase {
    var todo: Todo!
    
    override func setUp() {
        super.setUp()
        todo = Todo(withText: "Test")
    }
    
    override func tearDown() {
        super.tearDown()
        todo = nil
    }
    
    func testThatItIsNotDone() {
        XCTAssert(todo.done == false, ".done was not false")
    }
    
    func testThatItHasText() {
        XCTAssert(todo.text == "Test", ".text was not 'Test'. Got '\(todo.text)'")
    }
    
    func testThatSelectedIsFalse() {
        XCTAssert(todo.selected == false, ".selected was not false")
    }
}
