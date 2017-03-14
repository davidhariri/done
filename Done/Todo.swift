//
//  Todo.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import Foundation

class Todo: DoneBase {
    var text: String
    var done: Bool = false
    var selected: Bool = false
    
    init(withText t: String) {
        self.text = t
    }
    
    // Change the done property explicitly rather
    // than using toggleDone()
    func markDone(withDone d: Bool) {
        done = d
    }
    
    // Used to mark the done property as the opposite
    // of what it is right now
    func toggleDone() {
        markDone(withDone: !done)
        markUpdated()
    }
    
    // Used for when a TodoList is in editing mode
    // and a user is editing multiple todos at once
    func toggleSelected() {
        selected = !selected
    }
    
    // This method should be used to update the
    // text content of the Todo item
    func updateText(withText t: String) {
        text = t
        markUpdated()
    }
}
