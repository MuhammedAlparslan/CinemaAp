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
    
    var category        = [Category]()
    var successCallback : (()->())?
    var errorCallback   : ((String)->())?
    
    
    func getMovieItems(category: HomeCategory) {
        self.category.removeAll()
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

