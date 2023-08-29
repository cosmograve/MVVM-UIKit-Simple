//
//  ViewController.swift
//  MVVM+UIKit
//
//  Created by COSMOGRAVE on 29.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    var activityIndicator = UIActivityIndicatorView()
    var viewModel = MainViewViewModel()
    
    var cellDatasource = [MainCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setCostraints()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUsers()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Main Screen"
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        setupTableView()
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let isLoading, let self else {return}
            DispatchQueue.main.async {
                isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            }
        }
        viewModel.cellDataSourse.bind {[weak self] users in
            guard let self, let users else {return}
            self.cellDatasource = users
            reloadTableView()
        }
    }
}

extension MainViewController {
    private func setCostraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
