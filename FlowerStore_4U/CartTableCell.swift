//
//  CartTableCell.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 22/04/1443 AH.
//

import UIKit

class CartTableCell: UITableViewCell {

    @IBOutlet weak var imageInCart: UIImageView!
    @IBOutlet weak var nameInCart: UILabel!
    @IBOutlet weak var priceInCart: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
