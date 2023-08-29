//
//  NetworkDataFetch.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 30.08.2023.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    private init() {}
    
    func fetchUsers(response: @escaping ([Users]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([Users].self, from: data)
                    response(users, nil)
                } catch let jsonError {
                    print("decode Fail", jsonError)
                }
            case .failure(_):
                response(nil, .canNotParseResponse)
            }
        }
    }
}
