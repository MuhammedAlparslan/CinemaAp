//
//  ImageLabelCell.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 20.04.2023.
//

import UIKit

protocol ImageLabelCellProtocol {
    var titleText: String { get }
    var imageUrl : String { get }
}

class ImageLabelCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var topImage  : UIImageView!
    
    override func layoutSubviews() {
        topImage.layer.cornerRadius = 20
       
    }
    
    func confiqure(data: ImageLabelCellProtocol) {
        titleLabel.text = data.titleText
        topImage.loadUrl(data.imageUrl)
    }
}
