//
//  Users.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 29.08.2023.
//

import Foundation

struct Users: Codable {
    let name, username, email, phone: String
    let address: Address
}

struct Address: Codable {
    let street, suite, city: String
}
