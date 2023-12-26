//
//  ApiCall.swift
//  Movies
//
//  Created by Aral Benli on 5.12.2023.
//

import Foundation

enum NetworkError: Error {
    case canNotParseData
    case noData
    case invalidResponse
    case httpError(statusCode: Int)
    case networkError(description: String)
    case urlError
}
    
    public class ApiCall {
        
        static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMovieResponse, NetworkError>) -> Void) {
            if NetworkConstants.shared.apiKey.isEmpty {
                print("<!> API KEY is Missing <!>")
                print("<!> Get One from: https://www.themoviedb.org/ <!>")
                return
            }
            
            let urlString = NetworkConstants.shared.baseUrl +
            "trending/all/day?api_key=" +
            NetworkConstants.shared.apiKey
           // print(urlString)
            
            guard let url = URL(string: urlString) else {
                completionHandler(Result.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
                if let error = err {
                    print("Error: \(error.localizedDescription)")
                    completionHandler(.failure(.networkError(description: error.localizedDescription)))
                    return
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse else {
                    completionHandler(.failure(.invalidResponse))
                    return
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    // HTTP status code indicates success.
                    if let data = dataResponse {
                        do {
                            let resultData = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                            completionHandler(.success(resultData))
                        } catch {
                            print("Error decoding JSON: \(error.localizedDescription)")
                            completionHandler(.failure(.canNotParseData))
                        }
                    } else {
                        print("Data is nil")
                        completionHandler(.failure(.noData))
                    }
                default:
                    // Handle other HTTP status codes (e.g., error responses).
                    print("HTTP Status Code: \(httpResponse.statusCode)")
                    completionHandler(.failure(.httpError(statusCode: httpResponse.statusCode)))
                }
            }.resume()
        }
    }

