//
//  NetworkConstants.swift
//  Movies
//
//  Created by Aral Benli on 5.12.2023.
//

import Foundation


class NetworkConstants {
    
    public static var shared : NetworkConstants = NetworkConstants()
    
    private init(){
        //Singleton pattern
    }
    
    public var apiKey : String {
        get {
            return "649dc395f4c3b7765f91e1f3eb986dcf"
        }
    }
    
    public var baseUrl : String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var getImageBaseUrl : String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
    
    
}
