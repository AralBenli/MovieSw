//
//  DetailMovieViewController.swift
//  Movies
//
//  Created by Aral Benli on 6.12.2023.
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {

    //outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
    //view model
    var viewModel : DetailsMovieViewModel
    
    
    init(viewModel: DetailsMovieViewModel){
        self.viewModel = viewModel
        super.init(nibName: "DetailMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView(){
        self.title = "\(viewModel.movieTitle)"
        if let navigationBar = navigationController?.navigationBar {
               navigationBar.barTintColor = .orange
               navigationBar.isTranslucent = false // Ensure translucency is turned off
               let titleAttributes: [NSAttributedString.Key: Any] = [
                   NSAttributedString.Key.foregroundColor: UIColor.white,
                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20) // Adjust the font size as needed
               ]
               navigationBar.titleTextAttributes = titleAttributes
           }
        self.view.backgroundColor = .orange
        navigationController?.view.backgroundColor = .orange
        titleLabel.text = viewModel.movieTitle
        overview.text = viewModel.movieDescription
        imageView.kf.setImage(with: viewModel.movieImage)
        
    }
}
