//
//  EndPoint.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 29.08.2023.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/" + path
        
        guard let url = components.url else { preconditionFailure("invalid url") }
        return url
    }
}

extension EndPoint {
    static var users: Self {
        EndPoint(path: "users")
    }
}
