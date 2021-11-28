//
//  FlowerInfo+CoreDataProperties.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 23/04/1443 AH.
//
//

import UIKit
import CoreData


extension FlowerInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FlowerInfo> {
        return NSFetchRequest<FlowerInfo>(entityName: "FlowerInfo")
    }

    @NSManaged public var flowerDetails: String?
    @NSManaged public var flowerImage: UIImage?
    @NSManaged public var flowerName: String?
    @NSManaged public var flowerPrice: Double

}

extension FlowerInfo : Identifiable {

}
