//
//  MainViewControllerTableView.swift
//  Movies
//
//  Created by Aral Benli on 5.12.2023.
//

import Foundation
import UIKit


extension MainViewController: UITableViewDataSource , UITableViewDelegate {
    
    func setupTableView(){
        registerCells()
    }
    
    func registerCells(){
        tableView.register(MainMovieCell.register(), forCellReuseIdentifier: MainMovieCell.identifier)
        
    }
    
    func reloadTableView(){
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfsections()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainMovieCell.identifier, for: indexPath) as? MainMovieCell else {
            return UITableViewCell()
        }
        cell.setupCell(viewModel: cellDataSource[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = cellDataSource[indexPath.row].id
        openDetail(movieId: movieId)
    }
    
    
    
    
}





