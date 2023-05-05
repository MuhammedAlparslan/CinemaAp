//
//  SearchManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 27.04.2023.
//

import Foundation

class SearchManager {
    
    static let shared = SearchManager()
    
    func getMoviesSearch(query: String, page: Int, completion: @escaping((Movie?, String?) -> ())) {
        NetworkManager.shared.request(model: Movie.self,
                                      url: SearchEndPoint.search.path + "&query=\(query)" + "&page=\(page)",
                                      complete: completion)
    }
}
