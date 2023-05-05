//
//  PeopleHelper.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 21.04.2023.
//

import Foundation

enum PeopleEndPoint: String {
    case popular  = "person/popular"

    var path: String {
        NetworkHelper.shared.urlConfiqure(path: self.rawValue)
    }
}
