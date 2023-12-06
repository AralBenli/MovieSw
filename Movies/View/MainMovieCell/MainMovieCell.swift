//
//  MainMovieCell.swift
//  Movies
//
//  Created by Aral Benli on 6.12.2023.
//

import UIKit
import Kingfisher

class MainMovieCell: UITableViewCell {

    
    public static var identifier : String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    
    
    //outlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(color: .label, windth: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        movieImageView.round(25)
    }

    func setupCell(viewModel : MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        DispatchQueue.main.async { [weak self] in
            self?.movieImageView.kf.setImage(with: viewModel.imageUrl)
        }
    }
    
}
