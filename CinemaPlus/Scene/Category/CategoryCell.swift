//
//  CategoryCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 2.05.2023.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet private weak var categoryLabel: UILabel!
    
    func configure(data: String) {
        categoryLabel.text = data
    }
}
