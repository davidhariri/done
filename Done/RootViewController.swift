//
//  ViewController.swift
//  Done
//
//  Created by David Hariri on 2017-03-08.
//  Copyright © 2017 David Hariri. All rights reserved.
//

/*
 
RootViewController handles:
    - Scrolling through TodoLists
    - Mounting the TodoListProvider
    - Mounting TodoListViewControllers with their TodoLists
    - Creating the placeholder "New" TodoListView
    - Basic styling of the base of the app

*/

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let provider = TodoListProvider()
    var todoListsScrollView = UIScrollView()
    var SCREEN = CGSize()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SCREEN = view.frame.size
        
        view.backgroundColor = .black
        
        setUpTodoListsScrollView()
    }
    
    func setUpTodoListsScrollView() {
        todoListsScrollView = UIScrollView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: SCREEN.width,
                height: SCREEN.height
            )
        )
        
        todoListsScrollView.backgroundColor = .clear
        todoListsScrollView.isPagingEnabled = true
        todoListsScrollView.bounces = true
        todoListsScrollView.alwaysBounceHorizontal = true
        todoListsScrollView.delegate = self

        view.addSubview(todoListsScrollView)
        
        drawTodoLists()
    }
    
    func makeTodoListView(withXCoord x: CGFloat) -> TodoListView {
        let todoView = TodoListView(
            frame: CGRect(
                x: x,
                y: 0,
                width: SCREEN.width,
                height: SCREEN.height
            )
        )
        
        return todoView
    }
    
    func drawTodoLists() {
        // Draw all the built todo lists
        for (index, _) in provider.todoLists.enumerated() {
            let todoViewXCoord = (CGFloat(index) * SCREEN.width)
            let todoView = makeTodoListView(withXCoord: todoViewXCoord)
            todoListsScrollView.addSubview(todoView)
        }
        
        // Draw the placeholder new todolist
        let placeHolderView = makeTodoListView(
            withXCoord: CGFloat(provider.todoLists.count) * SCREEN.width)

        todoListsScrollView.addSubview(placeHolderView)
        
        todoListsScrollView.contentSize = CGSize(
            width: (CGFloat(provider.todoLists.count + 1) * SCREEN.width),
            height: SCREEN.height
        )
    }
    
    // When todoListsScrollView overscrolls past 64 points we
    // should add another todoList
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.x + scrollView.frame.size.width
        
        if (bottomEdge >= scrollView.contentSize.width) &&
            (provider.todoLists[provider.todoLists.count-1].name != nil) {
            provider.add()
            drawTodoLists()
        }
    }
    
    // When the scrollview is swiped we should dismiss any keyboards
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

