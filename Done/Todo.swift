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
    
    init(text: String) {
        self.text = text
        self.done = false
        self.created = Date()
        self.updated = nil
    }
    
    func wasUpdated() {
        self.updated = Date()
    }
    
    func toggleDone() {
        self.done = !self.done
        self.wasUpdated()
    }
    
    func updateText(newText: String) {
        self.text = newText
        self.wasUpdated()
    }
}
