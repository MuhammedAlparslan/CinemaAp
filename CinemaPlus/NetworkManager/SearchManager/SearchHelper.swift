//
//  SearchHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 27.04.2023.
//

import Foundation

enum SearchEndPoint: String {
    case search  = "search/movie"
    
    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
