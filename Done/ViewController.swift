//
//  ViewController.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let todoList = TodoList()
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var titleField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func titleWasEdited() {
        // Set the name
        todoList.name = titleField.text
        todoList.markUpdated()
        
        // Hide the keyboard
        titleField.resignFirstResponder()
    }
    
    @IBAction func editButtonWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func listTitleWasEdited(_ sender: Any) {
        titleWasEdited()
    }
    
    @IBAction func didTouch(_ sender: Any) {
        titleWasEdited()
    }
}

