//
//  DetailsViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 20.04.2023.
//

import Foundation


class DetailsViewModel {
    
    var actorId: Int?
    
    var items = [CastResults]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?

    func getMovieDetails() {
        PeopleManager.shared.getActorMovies(id: actorId ?? 0) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let data = data {
                self.items = data.cast ?? []
                self.successCallback?()
            }
        }
    }
}
