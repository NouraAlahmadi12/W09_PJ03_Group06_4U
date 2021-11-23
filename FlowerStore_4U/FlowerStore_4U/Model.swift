//
//  Model.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 17/04/1443 AH.
//

import UIKit

struct FlowersInfo {
    
    var flowerName : String
    var flowerDetails : String?
    var flowerImage : UIImage
    var flowerPrice : Double
    
}

class FlowersList {
    
    var flowerList :[FlowersInfo] = []
    
    func addItem (newItem : FlowersInfo) {
        flowerList.append(newItem)
    }
}
