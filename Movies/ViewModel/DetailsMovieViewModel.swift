//
//  DetailsMovieViewModel.swift
//  Movies
//
//  Created by Aral Benli on 6.12.2023.
//

import Foundation

class DetailsMovieViewModel {
    
    
    var movie: MovieResult
    
    
    var movieImage : URL?
    var movieTitle: String
    var movieDescription : String
    var movieId : Int
    
    
    
    init(movie: MovieResult) {
        self.movie = movie
        self.movieId = movie.id!
        self.movieTitle = movie.title ?? movie.name ?? ""
        self.movieDescription = movie.overview ?? ""
        self.movieImage = makeImageUrl(movie.backdropPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String)-> URL {
        URL(string: "\(NetworkConstants.shared.getImageBaseUrl)\(imageCode)")!
    }
    
    
}
