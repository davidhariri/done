//
//  DoneTests.swift
//  DoneTests
//
//  Created by David Hariri on 2017-03-09.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class TodoMethodsTests: XCTestCase {
    var todo: Todo!
    
    override func setUp() {
        super.setUp()
        todo = Todo(text: "Test")
    }
    
    override func tearDown() {
        super.tearDown()
        todo = nil
    }
    
    func testThatToggleDoneTogglesDone() {
        todo.toggleDone()
        XCTAssert(todo.done, ".done was not true after toggleDone()")
        todo.toggleDone()
        XCTAssert(!todo.done, ".done was not false after toggleDone()")
    }
    
    func testThatMarkUpdatedChangesUpdatedDate() {
        todo.markUpdated()
        let currentDate = Date()
        XCTAssert(todo.updated != nil, ".updated was nil")
        XCTAssert(round((todo.updated?.timeIntervalSince1970)!) ==
            round(currentDate.timeIntervalSince1970), ".updated was not the same as now")
    }
    
    func testThatUpdateTextUpdatesTheText() {
        let updatedText = "Buy coffee ☕️"
        todo.updateText(newText: updatedText)
        XCTAssert(todo.text == updatedText, ".text was not '\(updatedText)'")
    }
}
