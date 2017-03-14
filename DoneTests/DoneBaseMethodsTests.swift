//
//  DoneBaseMethodsTests.swift
//  Done
//
//  Created by David Hariri on 2017-03-14.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import XCTest
@testable import Done

class DoneBaseMethodsTests: XCTestCase {
    var doneBase: DoneBase!
    
    override func setUp() {
        super.setUp()
        doneBase = DoneBase()
    }
    
    override func tearDown() {
        super.tearDown()
        doneBase = nil
    }
    
    func testThatMarkUpdatedChangesUpdatedDate() {
        doneBase.markUpdated()
        let currentDate = Date()
        
        XCTAssert(doneBase.updated != nil, ".updated was nil")
        XCTAssert(round((doneBase.updated?.timeIntervalSince1970)!) ==
            round(currentDate.timeIntervalSince1970), ".updated was not the same as now")
    }
}
