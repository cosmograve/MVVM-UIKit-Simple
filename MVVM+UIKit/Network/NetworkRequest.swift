//
//  NetworkRequest.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 30.08.2023.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(completonHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completonHandler(.failure(.urlError))
                } else {
                    guard let data else {return}
                    completonHandler(.success(data))
                }
            }
        }
    }
}
