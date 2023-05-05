//
//  Title.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 23.04.2023.
//

import Foundation

 struct Genre: Codable {
    let genres: [GenreResults]?
}

struct GenreResults: Codable, CollectionCellProtocol {
    let id: Int?
    let name: String?
    
    var titleLabel: String {
        name ?? ""
    }
}
