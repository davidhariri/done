//
//  ViewController.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let todoList = TodoList()
        todoList.name = "Test List"
        todoList.add(todo: Todo(withText: "First Todo"))
        todoListLabel.text = todoList.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

