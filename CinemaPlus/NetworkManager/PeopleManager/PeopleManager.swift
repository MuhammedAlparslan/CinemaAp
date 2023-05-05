//
//  PeopleManager.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 21.04.2023.
//

import Foundation

class PeopleManager {
    
    static let shared = PeopleManager()
    
    func getActorItems(completion: @escaping((People?, String?) -> ())) {
        NetworkManager.shared.request(model: People.self,
                                      url: PeopleEndPoint.popular.path,
                                      complete: completion)
    }
    
    func getPopularPeople(page: Int, complete: @escaping ((People?, String?) -> ())) {
        NetworkManager.shared.request(model: People.self,
                                      url: PeopleEndPoint.popular.path + "&page=\(page)",
                                      complete: complete)
    }
    
    func getActorMovies(id: Int, completion: @escaping((Cast?, String?) -> ())) {
        NetworkManager.shared.request(model: Cast.self,
                                      url: NetworkHelper.shared.urlConfiqure(path: "person/\(id)/movie_credits"),
                                      complete: completion)
    }
}
