//
//  HomeHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 21.04.2023.
//

import Foundation


enum HomeCategory: String {
    case popular  = "home_category_popular"
    case topRated = "home_category_topRated"
    case upcoming = "home_category_upcoming"
    
}

enum HomeEndPoint: String {
    case popular  = "movie/popular"
//    case topRated = "movie/top_rated"
//    case upcoming = "movie/upcoming"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
