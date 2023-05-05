//
//  HomeViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 14.04.2023.
//

import Foundation

struct Category {
    let title: String
    let items: [MovieResult]
}

class HomeViewModel {
    
    var category = [Category]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getItems() {
        let items: [HomeCategory] = [.popular, .topRated, .upcoming ]
        for item in items {
            getMovieItems(category: item)
        }
    }
    
    private func getMovieItems(category: HomeCategory) {
        HomeManager.shared.getMovieItems(category: category) { movieData, error in
            if let error = error {
                self.errorCallback?(error)
            } else if let movieData = movieData {
                self.category.append(Category(title: category.rawValue.localizable,
                                              items: movieData.results ?? []))
                self.successCallback?()
            }
        }
    }
}

