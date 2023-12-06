//
//  MovieTableCellViewModel.swift
//  Movies
//
//  Created by Aral Benli on 6.12.2023.
//

import Foundation

class MovieTableCellViewModel{
    var id : Int
    var title : String
    var date : String
    var rating :String
    var imageUrl : URL?
    
    
    init(movie : MovieResult){
        self.id = movie.id!
        self.title = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate ??  ""
        self.rating = "\(movie.voteAverage ?? 0.0)/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String)-> URL {
        URL(string: "\(NetworkConstants.shared.getImageBaseUrl)\(imageCode)")!
    }
    
}
