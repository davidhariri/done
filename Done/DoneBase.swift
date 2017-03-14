//
//  DoneObj.swift
//  Done
//
//  Created by David Hariri on 2017-03-14.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import Foundation

class DoneBase {
    let created: Date = Date()
    var updated: Date? = nil
    
    func markUpdated() {
        updated = Date()
    }
}
