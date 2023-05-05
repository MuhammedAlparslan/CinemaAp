//
//  Profile.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 30.04.2023.
//

import Foundation

struct Profile {
    let name  : String
    let image : String
}

enum Profiles: String {
    case profile = "Profile"
    case wallet = "Wallet"
    case language = "Language"
}
