//
//  DetailsViewController.swift
//  FlowerStore_4U
//
//  Created by العــفاف . on 19/04/1443 AH.
//

import UIKit

class DetailsViewController: UIViewController {
    
        var details = [FlowerInfo]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var nameInDetails: UILabel!
    @IBOutlet weak var imgDetails: UIImageView!
    @IBOutlet weak var LaDetails: UILabel!
    @IBOutlet weak var priceDt: UILabel!
    
    var imageInDetails = UIImage()
    var DetailsInDetails = ""
    var priceInDetails : Double = 0.0
    var nameDetails : String = ""
    @IBAction func buttonCart(_ sender: Any) {
        
    }
    func saveUserData() {
        let item = FlowerInfo (context: context)
        priceDt.text = String(item.flowerPrice)
        imgDetails.image = UIImage(named: item.flowerImage ?? "")
        nameInDetails.text = item.flowerName
        
        do{try! context.save()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LaDetails.text = DetailsInDetails
        imgDetails.image = imageInDetails
        nameInDetails.text = nameDetails
        priceDt.text = String(priceInDetails)
    }
}
