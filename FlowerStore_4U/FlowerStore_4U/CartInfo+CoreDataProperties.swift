//
//  CartInfo+CoreDataProperties.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 23/04/1443 AH.
//
//

import UIKit
import CoreData


extension CartInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartInfo> {
        return NSFetchRequest<CartInfo>(entityName: "CartInfo")
    }

    @NSManaged public var flowerImageInCart: UIImage?
    @NSManaged public var flowerNameInCart: String?
    @NSManaged public var flowerPriceInCart: Double

}

extension CartInfo : Identifiable {

}
