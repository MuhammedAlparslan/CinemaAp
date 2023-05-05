//
//  CategoryViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 2.05.2023.
//

import Foundation

struct CategoryList {
    let title: String
    let items: [MovieResult]
}

class CategoryViewModel {
    var category = [CategoryList]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getMovies(data: TitleCategory) {
        let items: [TitleCategory] = []
        for item in items {
            getMovieItems(category: item)
        }
    }
    
    func getItems() {
        let items: [TitleCategory] = [.popular, .topRated, .upcoming]
        for item in items {
            getMovieItems(category: item)
        }
    }
    
    private func getMovieItems(category: TitleCategory) {
        CategoryManager.shared.getMovieList(category: category) { movieData, error in
            if let error = error {
                self.errorCallback?(error)
            } else if let movieData = movieData {
                self.category.append(CategoryList(title: category.rawValue.localizable,
                                                  items: movieData.results ?? []))
                self.successCallback?()
            }
        }
    }
}



    
    

