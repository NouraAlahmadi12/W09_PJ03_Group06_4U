//
//  ViewController.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 17/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{
    
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    var items = FlowersList()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.flowerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProuductID", for: indexPath) as! ProuductsCell
        
        cell.imgOfFlower.image = items.flowerList[indexPath.row].flowerImage
        cell.labelName.text = items.flowerList[indexPath.row].flowerName
        cell.labelPrice.text = String(items.flowerList[indexPath.row].flowerPrice)
        cell.imgOfFlower.layer.cornerRadius = 30
        return cell
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.addItem(newItem: FlowersInfo(flowerName: "Orang Bouqeut", flowerDetails: "Orange Flowers with Flowers Height 100 CM Width 50 CM", flowerImage: UIImage(named: "OrangeFlower")!, flowerPrice: 121))
        
        items.addItem(newItem: FlowersInfo(flowerName: "Blue Bouqeut", flowerDetails: "Blue Flowers Height 86 CM Width 24 CM", flowerImage: UIImage(named: "BlueFlower")!, flowerPrice: 256))
        
        items.addItem(newItem: FlowersInfo(flowerName: "Pink Bouqeut", flowerDetails: "Pink Flowers Height 57 CM Width 60 CM", flowerImage: UIImage(named: "PinkFlower")!, flowerPrice: 162.50))
        
        items.addItem(newItem: FlowersInfo(flowerName: "Red Bouqeut", flowerDetails: "Red , black and white Flowers with Height 76 CM Width 47 CM", flowerImage: UIImage(named: "RedFlower")!, flowerPrice: 97.92))
        
        items.addItem(newItem: FlowersInfo(flowerName: "White Bouqeut", flowerDetails: "white Flowers Height 72 CM Width 60 CM", flowerImage: UIImage(named: "WhiteFlower")!, flowerPrice: 90.92))
        
        
        items.addItem(newItem: FlowersInfo(flowerName: "sun Bouqeut", flowerDetails: "sun Flowers Height 60 CM Width 15 CM", flowerImage: UIImage(named: "sunFlower")!, flowerPrice: 100))
        
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
    }
}

