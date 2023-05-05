//
//  ProfileCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 30.04.2023.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    var items = [Profile]()
    
    func configure(data: Profile) {
        nameLabel.text  = data.name
        iconImage.image = UIImage(named: data.image)
    }
}
