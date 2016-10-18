//
//  BookDataProvider.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/14/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import UIKit

@objc final class BookDataProvider: NSObject {

    var shelf: Shelf?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.addSubview(refreshControl)
        }
    }

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadBooks), for: UIControlEvents.valueChanged)
        return refreshControl
    }()

    func reloadBooks() {

        var request = BackendGetShelfRequest()

        request.successHandler = { [unowned self] shelf in
            DispatchQueue.main.async {
                self.shelf = shelf
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }

        request.failureHandler = { [unowned self] error in
            DispatchQueue.main.async {
                self.refreshControl.endRefreshing()
            }
        }

        request.execute()
    }

    func addBook(title: String, author: String, numberOfPages: Int32) {

        let book = Book(title: title, author: author, numberOfPages: numberOfPages)
        shelf?.books.append(book)
        tableView.reloadData()

        let request = BackendPostBookRequest(title: title, author: author, numberOfPages: numberOfPages)
        
        request.execute()
    }
}

extension BookDataProvider: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let shelf = shelf {
            return shelf.books.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell
        if let shelf = shelf {
            let book = shelf.books[indexPath.row]
            configure(cell: cell, with: book)
        }
        return cell
    }

    func configure(cell: BookCell, with book: Book) {
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.numberOfPagesLabel.text = "\(book.numberOfPages) pages"
    }
}

extension BookDataProvider: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
