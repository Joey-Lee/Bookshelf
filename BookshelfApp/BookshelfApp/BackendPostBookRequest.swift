//
//  BackendPostBookRequest.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/11/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import Foundation

struct BackendPostBookRequest {

    var title: String
    var author: String
    var numberOfPages: Int32
    var successHandler: SuccessHandler?
    var failureHandler: FailureHandler?

    init(title: String, author: String, numberOfPages: Int32, successHandler: SuccessHandler? = nil, failureHandler: FailureHandler? = nil) {
        self.title = title
        self.author = author
        self.numberOfPages = numberOfPages
        self.successHandler = successHandler
        self.failureHandler = failureHandler
    }
}

extension BackendPostBookRequest: BackendRequest {
    
    var endpoint: String {
        return "book"
    }

    var method: BackendRequestMethod {
        return .post
    }

    var headers: [String: String]? {
        return BackendRequestHeader.contentTypeOctetStream
    }

    var data: Data? {
        let book = Book(title: title, author: author, numberOfPages: numberOfPages)
        guard let serializedBook = try? book.serializeProtobuf() else {
            return nil
        }
        return serializedBook
    }

    func didSucceed(with data: Data) {
        if let successHandler = successHandler {
            successHandler()
        }
    }

    func didFail(with error: Error) {
        if let failureHandler = failureHandler {
            failureHandler(error)
        }
    }
}
