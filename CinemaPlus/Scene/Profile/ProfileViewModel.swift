//
//  ProfileViewModel.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 30.04.2023.
//

import Foundation

class ProfileViewModel {
    
    var profileData = [Profile(name: "Profile",  image: "ProfileIcon", type: .profile),
                       Profile(name: "Wallet",   image: "WalletIcon", type: .wallet),
                       Profile(name: "Language", image: "LanguageIcon", type: .language)]
}
