//
//  LanguageCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 30.04.2023.
//

import UIKit

class LanguageCell: UITableViewCell {
    @IBOutlet private weak var flagImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    let items = [Language]()
    
    func configureData(data: Language) {
        flagImage.image = UIImage(named: data.image)
        nameLabel.text  = data.name
    }
}
