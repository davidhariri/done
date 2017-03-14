//
//  DoneBaseAttibuteTests.swift
//  Done
//
//  Created by David Hariri on 2017-03-14.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class DoneBaseAttibutesTests: XCTestCase {
    var doneBase: DoneBase!
    
    override func setUp() {
        super.setUp()
        doneBase = DoneBase()
    }
    
    override func tearDown() {
        super.tearDown()
        doneBase = nil
    }
    
    func testThatItHasNoUpdatedValue() {
        XCTAssert(doneBase.updated == nil, ".updated was not nil")
    }
    
    func testThatCreatedIsRoughlyNow() {
        let currentDate = Date()
        
        XCTAssert(round((doneBase.created.timeIntervalSince1970)) ==
            round(currentDate.timeIntervalSince1970), ".created was not the same as now")
    }
}
