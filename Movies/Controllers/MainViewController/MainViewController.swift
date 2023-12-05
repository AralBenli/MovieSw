//
//  MainViewController.swift
//  Movies
//
//  Created by Aral Benli on 5.12.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()

    var cellDataSource : [MovieResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func configView() {
        self.title = "Trending Movies"
        self.view.backgroundColor = .orange
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
            return
        }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self , let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
}

