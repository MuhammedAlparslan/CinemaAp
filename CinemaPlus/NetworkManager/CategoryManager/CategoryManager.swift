//
//  CategoryManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 5.05.2023.
//

import Foundation


class CategoryManager {
    
    static let shared = CategoryManager()
    
    func getMovieList(category: TitleCategory, completion: @escaping((Movie?, String?) -> ())) {
        var url = ""
        switch category {
        case .popular:
            url = CategoryEndPoint.popular.path
        case .topRated:
            url = CategoryEndPoint.topRated.path
        case .upcoming:
            url = CategoryEndPoint.upcoming.path
        }
        
        NetworkManager.shared.request(model: Movie.self, url: url, complete: completion)
    }
}
