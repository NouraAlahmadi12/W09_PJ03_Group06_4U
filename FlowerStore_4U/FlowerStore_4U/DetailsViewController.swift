//
//  DetailsViewController.swift
//  FlowerStore_4U
//
//  Created by العــفاف . on 19/04/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    var details = FlowerInfo()
    
    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var LaDetails: UILabel!
    @IBOutlet weak var priceDt: UILabel!
    
    var imageInDetails = UIImage()
    var DetailsInDetails = ""
    var priceInDetails : Double = 0.0
    @IBAction func buttonCart(_ sender: Any) {
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LaDetails.text = DetailsInDetails
        imgDetails.image = imageInDetails
        priceDt.text = String(priceInDetails)
    }
}
