//
//  HomeManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 21.04.2023.
//

import Foundation


class HomeManager {
    
    static let shared = HomeManager()
    
    func getMovieItems(category: HomeCategory, completion: @escaping((Movie?, String?) -> ())) {
        var url = ""
        switch category {
        case .popular:
            url = HomeEndPoint.popular.path
        default:
            break
        }
        
        NetworkManager.shared.request(model: Movie.self, url: url, complete: completion)
    }
    
    func getPopularMovie(page: Int, complete: @escaping ((Movie?, String?) -> ())) {
        NetworkManager.shared.request(model: Movie.self,
                                      url: HomeEndPoint.popular.path + "&page=\(page)",
                                      complete: complete)
    }
}
