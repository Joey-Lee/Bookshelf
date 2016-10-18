//
//  AddBookViewController.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/17/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var numberOfPagesTextField: UITextField!
}

extension AddBookViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
