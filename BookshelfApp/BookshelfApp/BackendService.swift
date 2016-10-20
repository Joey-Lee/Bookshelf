//
//  BackendService.swift
//  BookshelfApp
//
//  Created by Milan Stevanović on 10/11/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

import Foundation

final class BackendService {

    public static let sharedInstance = BackendService()

    let baseUrl = URL(string: "http://localhost:8080")!
    let session = URLSession.shared

    public func execute(backendRequest: BackendRequest) {

        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(backendRequest.endpoint), cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10.0)

        urlRequest.httpMethod = backendRequest.method.rawValue

        if let data = backendRequest.data {
            urlRequest.httpBody = data
        }

        if let headers = backendRequest.headers {
            for (key, value) in headers {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }

        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, let _ = response, error == nil else {
                if let error = error {
                    print("[BACKEND_SERVICE] BACKEND_REQUEST | \(backendRequest.method) | \(backendRequest.endpoint) | DID_FAIL | ERROR = \(error.localizedDescription)")
                    backendRequest.didFail(with: error)
                }
                return
            }
            print("[BACKEND_SERVICE] BACKEND_REQUEST | \(backendRequest.method) | \(backendRequest.endpoint) | DID_SUCCEED")
            backendRequest.didSucceed(with: data)
        }

        task.resume()
    }
}
