//
//  MainViewModel.swift
//  Movies
//
//  Created by Aral Benli on 5.12.2023.
//

import Foundation
import UIKit

class MainViewModel {
    
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource : Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource : TrendingMovieResponse?
    
    
    func numberOfsections() -> Int {
        1
    }
    
    func numberOfRows(in secion:Int) -> Int {
        self.dataSource?.results?.count ?? 0
    }
    
    func getData(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        ApiCall.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top Trending Counts : \(data.results!.count)")
                self?.dataSource = data
                self?.mapCellData()
                //print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData(){
        self.cellDataSource.value = self.dataSource?.results?.compactMap({ MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie : MovieResult) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
}
