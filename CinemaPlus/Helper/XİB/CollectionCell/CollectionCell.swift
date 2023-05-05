//
//  CollectionCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 22.04.2023.
//

import UIKit

protocol CollectionCellProtocol {
    var titleLabel  : String { get }
}

class CollectionCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configureLabel(data: CollectionCellProtocol) {
        titleLabel.text = data.titleLabel
    }
}
