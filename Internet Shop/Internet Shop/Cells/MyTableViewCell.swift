//
//  MyTableViewCell.swift
//  Internet Shop
//
//  Created by Anelya on 2/8/21.
//  Copyright © 2021 Anelya. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myTableLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    @IBOutlet weak var myPriceLabel: UILabel!
    @IBOutlet weak var myAddToCartButton: UIButton!
    
    var delegate: ViewConrollerDelegate?
    var id = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func addToCart(_ sender: Any) {
        delegate?.setId(id)
    }
}
