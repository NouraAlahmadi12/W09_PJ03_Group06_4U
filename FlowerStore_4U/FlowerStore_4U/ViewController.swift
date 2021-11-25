//
//  ViewController.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 17/04/1443 AH.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var photoBannerArr = [UIImage(named: "Banner1")!,UIImage(named: "Banner2")!,UIImage(named: "Banner3")!]
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
    var items = FlowersList()
    var timer: Timer?
    var currentIndex = 0
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannerCollectionView {
            return photoBannerArr.count
        }else{
            return items.flowerList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == itemsCollectionView{
            let prouductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProuductID", for: indexPath) as! ProuductsCell
            
            prouductCell.imgOfFlower.image = items.flowerList[indexPath.row].flowerImage
            prouductCell.labelName.text = items.flowerList[indexPath.row].flowerName
            prouductCell.labelPrice.text = String(items.flowerList[indexPath.row].flowerPrice)
            prouductCell.imgOfFlower.layer.cornerRadius = 30
            return prouductCell
            
        }else{
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerID", for: indexPath) as! PhotoBannerCell
            
            bannerCell.PhotoOffers.image = photoBannerArr[indexPath.row]
            return bannerCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.width, height: bannerCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == bannerCollectionView {
            return 0
        }else{
            return 1
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNext() {
        if currentIndex < photoBannerArr.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        
        bannerCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.image = items.flowerList[indexPath.row].flowerImage
        vc.Details = items.flowerList[indexPath.row].flowerDetails ?? "No Details"
        vc.priceDetails = String(items.flowerList[indexPath.row].flowerPrice)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items.addItem(newItem: FlowersInfo(flowerName: "Orang Bouqeut", flowerDetails: "Orange Flowers with Flowers Height 100 CM Width 50 CM", flowerImage: UIImage(named: "OrangeFlower")!, flowerPrice: 121))
        
        items.addItem(newItem: FlowersInfo(flowerName: "Blue Bouqeut", flowerDetails: "Blue Flowers Height 86 CM Width 24 CM", flowerImage: UIImage(named: "BlueFlower")!, flowerPrice: 96))
        
        items.addItem(newItem: FlowersInfo(flowerName: "Pink Bouqeut", flowerDetails: "Pink Flowers Height 57 CM Width 60 CM", flowerImage: UIImage(named: "PinkFlower")!, flowerPrice: 162.50))
        
        items.addItem(newItem: FlowersInfo(flowerName: "Red Bouqeut", flowerDetails: "Red , black and white Flowers with Height 76 CM Width 47 CM", flowerImage: UIImage(named: "RedFlower")!, flowerPrice: 97.92))
        
        items.addItem(newItem: FlowersInfo(flowerName: "White Bouqeut", flowerDetails: "white Flowers Height 72 CM Width 60 CM", flowerImage: UIImage(named: "WhiteFlower")!, flowerPrice: 236.92))
        
        
        items.addItem(newItem: FlowersInfo(flowerName: "sun Bouqeut", flowerDetails: "sun Flowers Height 60 CM Width 15 CM", flowerImage: UIImage(named: "sunFlower")!, flowerPrice: 100))
        
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self

        startTimer()
        
    }
}

