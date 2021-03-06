//
//  TodoListView.swift
//  Done
//
//  Created by David Hariri on 2017-03-26.
//  Copyright © 2017 David Hariri. All rights reserved.
//

import UIKit

let blackColor = UIColor(red: 0.1212, green: 0.1248, blue: 0.1891, alpha: 1)

class TodoListView: UIView {
    // Class override default methods
    let titleInput = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Basic styles
        backgroundColor = .white
        
        // Set up a gesture recognizer for tapping out of editing the title
        let tapRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(viewWasTapped)
        )
        
        self.addGestureRecognizer(tapRecognizer)
        
        setUpTitleInput()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewWasTapped(_ selector: UITapGestureRecognizer) {
        self.titleInput.resignFirstResponder()
    }
    
    // Sets up the text field with all default properties
    func setUpTitleInput() {
        titleInput.placeholder = "My New List"
        titleInput.minimumFontSize = 16
        titleInput.autocapitalizationType = .words
        titleInput.font = .systemFont(ofSize: 38, weight: UIFontWeightSemibold)
        titleInput.returnKeyType = .done
        titleInput.adjustsFontSizeToFitWidth = true
        titleInput.textColor = blackColor
        titleInput.tintColor = blackColor
        titleInput.frame.size = CGSize(
            width: frame.width - 32,
            height: 70
        )
        titleInput.frame.origin = CGPoint(x: 16, y: 20)
        addSubview(titleInput)
    }
}
