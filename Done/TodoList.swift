//
//  TodoList.swift
//  Done
//
//  Created by David Hariri on 2017-03-13.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import Foundation

class TodoList: DoneBase {
    var items = [Todo]()
    var length: Int = 0
    var name: String = ""
    var editing: Bool = false
    var doneMarker: Bool = true
    
    // Used to toggle the state of editing the TodoList
    func toggleEditing() {
        editing = !editing
        
        // If we're no longer editing we should reset
        // the doneMarker which is in charge of mass
        // marking selected items as done/undone
        if !editing {
            doneMarker = true
        }
    }
    
    // Adds a Todo to the TodoList at some index
    // By default, at the beginning of the list
    func add(todo t: Todo, atIndex i: Int = 0) {
        if i <= length {
            items.insert(t, at: i)
            length += 1
            markUpdated()
        }
    }
    
    // Removes a Todo from the TodoList at some index
    func remove(atIndex i: Int) {
        if i <= length {
            items.remove(at: i)
            length -= 1
            markUpdated()
        }
    }
    
    // Iterates through all the todo items and removes
    // the selected todos from the TodoList
    func removeSelected() {
        for (index, todo) in items.enumerated() {
            if todo.selected {
                remove(atIndex: index)
            }
        }
        
        length = items.count
        markUpdated()
    }
    
    // Iterates throught all the todo items and marks
    // the selected done / undone depending on there state
    func updateSelectedDone() {
        for todo in items {
            if todo.selected {
                todo.markDone(withDone: doneMarker)
            }
        }
        
        // Swap the doneMarker in case the user wants to mark all as (un)done
        doneMarker = !doneMarker
        markUpdated()
    }
}
