//
//  Detaisl.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 22.04.2023.
//

import Foundation

// MARK: - Welcome
struct Cast: Codable {
    let cast, crew: [CastResults]?
    let id: Int?
}

// MARK: - Cast
struct CastResults: Codable, MovieCellProtocol {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    let department: String?
    let job: String?
    
    var imageUrl: String {
        return posterPath ?? ""
    }
    
    var nameLabel: String {
        title ?? ""
    }
    
    var imdbLabel: String {
        "\(voteAverage ?? 0.0)"
    }
    
    var dateLabel: String {
       releaseDate ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case genreIDS = "genre_ids"
            case id
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case character
            case creditID = "credit_id"
            case order, department, job
        }
    }
    
    

