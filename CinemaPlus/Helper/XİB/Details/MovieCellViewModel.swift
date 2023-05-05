//
//  MovieCellViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 23.04.2023.
//

import Foundation


class MovieCellViewModel {
    
    var items = [GenreResults]()
    var successCallback: (()->())?
    var errorCallback: ((String)->())?

    func getMovieTitle() {
        NetworkManager.shared.request(model: Genre.self,
                                      url: NetworkHelper.shared.urlConfiqure(path: "genre/movie/list")) {   movieTitle, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movieTitle = movieTitle {
                self.items = movieTitle.genres ?? []
                self.successCallback?()
            }
        }
    }
}

