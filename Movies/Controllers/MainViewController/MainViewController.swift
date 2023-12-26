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
    
    var cellDataSource : [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
    
    func configView() {
        title = "Trending Movies"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.barTintColor = .orange
            navigationBar.isTranslucent = false // Ensure translucency is turned off
            let titleAttributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) // Adjust the font size as needed
            ]
            navigationBar.titleTextAttributes = titleAttributes
        }
        navigationController?.view.backgroundColor = .orange
        
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self, let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self, let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetail(movieId : Int){
        guard let movie = viewModel.retriveMovie(with: movieId) else {
            return
        }
        let detailViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailMovieViewController(viewModel: detailViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}

