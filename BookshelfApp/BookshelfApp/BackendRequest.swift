//
//  BackendRequest.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/11/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import Foundation

typealias SuccessHandler = (Void) -> Void
typealias FailureHandler = (Error) -> Void

enum BackendRequestMethod: String {
    case get, post, put, delete
}

struct BackendRequestHeader {

    static let contentTypeOctetStream = ["Content-Type": "application/octet-stream"]
    static let acceptOctetStream = ["Accept": "application/octet-stream"]
}

protocol BackendRequest {

    var endpoint: String { get }
    var method: BackendRequestMethod { get }
    var headers: [String: String]? { get }
    var data: Data? { get }
    func didSucceed(with data: Data)
    func didFail(with error: Error)
    func execute()
}

extension BackendRequest {
    
    func execute() {
        BackendService.sharedInstance.execute(backendRequest: self)
    }
}
