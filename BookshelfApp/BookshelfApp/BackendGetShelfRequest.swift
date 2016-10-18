//
//  BackendGetShelfRequest.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/11/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import Foundation

typealias GetShelfSuccessHandler = (Shelf) -> Void

struct BackendGetShelfRequest {

    var successHandler: GetShelfSuccessHandler?
    var failureHandler: FailureHandler?
}

extension BackendGetShelfRequest: BackendRequest {

    var endpoint: String {
        return "shelf"
    }

    var method: BackendRequestMethod {
        return .get
    }

    var headers: [String: String]? {
        return BackendRequestHeader.acceptOctetStream
    }

    var data: Data? {
        return nil
    }

    func didSucceed(with data: Data) {
        if let shelf = try? Shelf(protobuf: data), let successHandler = successHandler {
            successHandler(shelf)
        }
    }

    func didFail(with error: Error) {
        if let failureHandler = failureHandler {
            failureHandler(error)
        }
    }
}
