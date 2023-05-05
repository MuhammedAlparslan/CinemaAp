//
//  SearchViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 24.04.2023.
//

import Foundation

class SearchViewModel {
    
    var text = String() {
        didSet {
            fetchData()
        }
    }
    var items = [MovieResult]()
    var successCallback: (()->())?
    
    var movie: Movie?
    var errorCallback: ((String)->())?
    
    func fetchData() {
        SearchManager.shared.getMoviesSearch(query: text, page: (movie?.page ?? 0) + 1) { movieList, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movieList = movieList {
                self.items.append(contentsOf: movieList.results ?? [])
                self.successCallback?()
            }
        }
    }
    
    func pagination(index: Int) {
        if (index == items.count - 1) && (movie?.page ?? 0 <= movie?.totalPages ?? 0 ) {
            fetchData()
        }
    }
    
    func reset() {
        items.removeAll()
        movie = nil
    }
}


