//
//  MainViewViewModel.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 29.08.2023.
//

import Foundation

class MainViewViewModel {
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var cellDataSourse: Observable<[MainCellViewModel]> = Observable(value: nil)
    var dataSourse: [Users]?
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(_ section: Int) -> Int {
        dataSourse?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else {return}
            self.isLoading.value = false
            if error != nil {
                print("error alert")
            } else if let users {
                self.dataSourse = users
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSourse.value = dataSourse?.compactMap({ MainCellViewModel($0) })
    }
}
