//
//  BooksViewController.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/17/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    @IBOutlet weak var bookDataProvider: BookDataProvider!

    override func viewDidLoad() {
        super.viewDidLoad()
        bookDataProvider.reloadBooks()
    }

    @IBAction func unwindToBooks(unwindSegue: UIStoryboardSegue) {
        if let addBookViewController = unwindSegue.source as? AddBookViewController {
            if  let title = addBookViewController.titleTextField.text,
                let author = addBookViewController.authorTextField.text,
                let numberOfPagesString = addBookViewController.numberOfPagesTextField.text,
                let numberOfPages = Int32(numberOfPagesString) {
                let book = Book(title: title, author: author, numberOfPages: numberOfPages)
                bookDataProvider.add(book: book)
            }
        }
    }

}
