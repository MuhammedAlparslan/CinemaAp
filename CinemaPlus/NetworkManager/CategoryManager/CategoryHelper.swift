//
//  CategoryHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 5.05.2023.
//

import Foundation

enum TitleCategory: String {
    case popular  = "home_category_popular"
    case topRated = "home_category_topRated"
    case upcoming = "home_category_upcoming"
    
}

enum CategoryEndPoint: String {
    case popular  = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
