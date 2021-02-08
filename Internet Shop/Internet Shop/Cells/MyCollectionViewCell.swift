//
//  MyCollectionViewCell.swift
//  Internet Shop
//
//  Created by Anelya on 2/8/21.
//  Copyright © 2021 Anelya. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTitleLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    @IBOutlet weak var myPriceLabel: UILabel!
    
    var delegate: ViewConrollerDelegate?
    var id = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addToCart(_ sender: Any) {
        delegate?.setId(id)
    }
}
