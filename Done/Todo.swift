//
//  Todo.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import Foundation

class Todo {
    var text: String
    var done: Bool
    let created: Date
    var updated: Date?
    
    init() {
        self.text = ""
        self.done = false
        self.created = Date()
        self.updated = nil
    }
    
    func toggleDone() {
        self.done = !self.done
    }
    
    func wasUpdated() {
        self.updated = Date()
    }
    
    func updateText(newText: String) {
        self.text = newText
        self.wasUpdated()
    }
}
