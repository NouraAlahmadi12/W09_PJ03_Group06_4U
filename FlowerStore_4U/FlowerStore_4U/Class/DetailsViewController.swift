//
//  DetailsViewController.swift
//  FlowerStore_4U
//
//  Created by العــفاف . on 19/04/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var LaDetails: UILabel!
    @IBOutlet weak var priceDt: UILabel!
    
    
    var imag = UIImage()
    var Details = ""
    var priceDetails = ""
    @IBAction func buttonCart(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LaDetails.text = Details
        imgDetails.image = imag
        priceDt.text = priceDetails
    }
}
