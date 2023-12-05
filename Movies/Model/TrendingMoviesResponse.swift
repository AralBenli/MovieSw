//
//  TrendingMoviesResponse.swift
//  Movies
//
//  Created by Aral Benli on 5.12.2023.
//

import Foundation
// MARK: - TrendingMovieResponse
struct TrendingMovieResponse : Codable {
    let page : Int?
    let total_pages : Int?
    let total_results : Int?
    let results : [MovieResult]?
}

// MARK: - MovieResult
struct MovieResult: Codable {
    let adult: Bool?
    let backdropPath: String?
    let title: String?
    let name : String?
    let originalLanguage: OriginalLanguage
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let mediaType: MediaType
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case title = "title"
        case name = "name"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
    case ja = "ja"
    case ko = "ko"
}
