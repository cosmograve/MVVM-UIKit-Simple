//
//  MainCellViewModel.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 30.08.2023.
//

import Foundation

class MainCellViewModel {
    
    var name: String
    var email: String
    
    init(_ user: Users) {
        self.name = user.name
        self.email = user.email
    }
}

