//
//  BackendAddBookRequest.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/11/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import Foundation

struct BackendAddBookRequest {

    let book: Book
    var successHandler: SuccessHandler?
    var failureHandler: FailureHandler?

    init(book: Book, successHandler: SuccessHandler? = nil, failureHandler: FailureHandler? = nil) {
        self.book = book
        self.successHandler = successHandler
        self.failureHandler = failureHandler
    }
}

extension BackendAddBookRequest: BackendRequest {
    
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
