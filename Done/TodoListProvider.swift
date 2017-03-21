//
//  TodoListProvider.swift
//  Done
//
//  Created by David Hariri on 2017-03-16.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import Foundation

class TodoListProvider {
    var todoLists = [TodoList]()
    var length: Int = 0
    
    // Initializer creates a blank TodoList
    init() {
        add()
    }
    
    // Adds a TodoList at some index
    // By default, at the beginning of the todoLists list
    func add() {
        todoLists.append(TodoList())
        length += 1
    }
    
    // Removes a Todo from the TodoList at some index
    func remove(atIndex i: Int) {
        if i <= length {
            todoLists.remove(at: i)
            length -= 1
        }
    }
}
