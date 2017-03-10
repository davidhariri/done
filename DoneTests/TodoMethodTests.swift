//
//  TodoMethodTests.swift
//  Done
//
//  Created by David Hariri on 2017-03-10.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class TodoDefaultAttributesTests: XCTestCase {
    var todo: Todo!
    
    override func setUp() {
        super.setUp()
        todo = Todo(text: "Test")
    }
    
    override func tearDown() {
        super.tearDown()
        todo = nil
    }
    
    func testThatIsIsNotDone() {
        XCTAssert(todo.done == false, ".done was not false")
    }
    
    func testThatItHasText() {
        XCTAssert(todo.text == "Test", ".text was not 'Test'. Got '\(todo.text)'")
    }
    
    func testThatItHasNoUpdatedValue() {
        XCTAssert(todo.updated == nil, ".updated was not nil")
    }
    
    func testThatCreatedIsRoughlyNow() {
        let currentDate = Date()
        XCTAssert(round((todo.created.timeIntervalSince1970)) ==
            round(currentDate.timeIntervalSince1970), ".created was not the same as now")
    }
}
