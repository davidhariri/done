//
//  ViewController.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let todoLists = TodoListProvider()
    let generator = UIImpactFeedbackGenerator(style: UIImpactFeedbackStyle.medium)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        
/*

         View Hierarchy:
         view
            todoListsScrollView
                todoListView
                    todoListTitle
                    todoListEditButton
                    todoListTableView
                        todoListCell
                            ...
            todoListsActionBar
         
*/
        
        // View Constants
        let SCREEN = view.frame.size
        
        let todoListsScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREEN.width, height: SCREEN.height))
        
        todoListsScrollView.backgroundColor = .clear
        
        self.view.addSubview(todoListsScrollView)
        
        todoListsScrollView.isPagingEnabled = true
        todoListsScrollView.bounces = true
        todoListsScrollView.alwaysBounceHorizontal = true
        todoListsScrollView.delegate = self
        
        for (index, _) in todoLists.todoLists.enumerated() {
            let todoViewXCoord = (CGFloat(index) * SCREEN.width)
            let todoView = TodoListView(
                frame: CGRect(
                    x: todoViewXCoord,
                    y: 0,
                    width: SCREEN.width,
                    height: SCREEN.height
                )
            )
            
            todoView.backgroundColor = .white

            // Add the TodoListView
            todoListsScrollView.addSubview(todoView)
        }
        
        todoListsScrollView.contentSize = CGSize(
            width: (CGFloat(todoLists.todoLists.count) * SCREEN.width),
            height: SCREEN.height
        )
        
        generator.prepare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x == -50.0 {
            generator.impactOccurred()
        }
    }
}

