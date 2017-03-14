//
//  ViewController.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var todos = [Todo]()
        todos.append(Todo(withText: "First Todo"))
        print(todos)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

