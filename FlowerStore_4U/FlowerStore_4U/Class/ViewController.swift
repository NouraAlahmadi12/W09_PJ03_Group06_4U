//
//  ViewController.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 17/04/1443 AH.
//

import UIKit
import CoreData

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var photoBannerArr = [UIImage(named: "Banner1")!,UIImage(named: "Banner2")!,UIImage(named: "Banner3")!]
    
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    // TODO: Change
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var flower = [FlowerInfo]()
    
    var timer: Timer?
    var currentIndex = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == bannerCollectionView {return photoBannerArr.count }else{return flower.count }}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == itemsCollectionView{
            let prouductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProuductID", for: indexPath) as! ProuductsCell
            let flowerItems = FlowerInfo(context :context)
            flowerItems.flowerName = prouductCell.labelName.text
            flowerItems.flowerPrice = Double(prouductCell.labelPrice.text!)!
            //            flowerItems.flowerDetails = prouductCell.imgOfFlower.image?
            
            
            prouductCell.imgOfFlower.layer.cornerRadius = 30
            return prouductCell
            
        }else{
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerID", for: indexPath) as! PhotoBannerCell
            
            bannerCell.PhotoOffers.image = photoBannerArr[indexPath.row]
            return bannerCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let flowerSelected = FlowerInfo(context :context)
        
        flowerSelected.flowerDetails = vc.Details
        flowerSelected.flowerPrice = Double(vc.priceDetails)!
        //        let image = UIImage(data: vc.imag)
        //        flowerSelected.flowerImage = vc.image
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {return CGSize(width: bannerCollectionView.frame.width, height: bannerCollectionView.frame.height)}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {if collectionView == bannerCollectionView {return 0}else{return 1}}
    
    func startTimer() {timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)}
    
    @objc func moveToNext() {
        if currentIndex < photoBannerArr.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        
        bannerCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    func fillDBWithFlowers(){
        
        let item1 = FlowerInfo(context: context)
        item1.flowerName = "Orang Bouqeut"
        item1.flowerDetails = "Orange Flowers with Flowers Height 100 CM Width 50 CM"
        //        item1.flowerImage = UIImage(named: "OrangeFlower")!
        item1.flowerPrice = 121
        
        let item2 = FlowerInfo(context: context)
        item2.flowerName = "Blue Bouqeut"
        item2.flowerDetails = "Blue Flowers Height 86 CM Width 24 CM"
        //        item2.flowerImage = UIImage(named: "BlueFlower")!
        item2.flowerPrice = 93.51
        
        let item3 = FlowerInfo(context: context)
        item3.flowerName = "Pink Bouqeut"
        item3.flowerDetails = "Pink Flowers Height 57 CM Width 60 CM"
        item3.flowerImage = "PinkFlower"
        //        item3.flowerImage = String(UIImage(named: "PinkFlower"))
        item3.flowerPrice = 163.40
        
        let item4 = FlowerInfo(context: context)
        item4.flowerName = "Red Bouqeut"
        item4.flowerDetails = "Red , black and white Flowers with Height 76 CM Width 47 CM"
        item4.flowerImage = "RedFlower"
        //        item4.flowerImage = UIImage(named: "RedFlower")!
        item4.flowerPrice = 97.23
        
        let  item5 = FlowerInfo (context: context)
        item5.flowerName = "White Bouqeut"
        item5.flowerDetails = "white Flowers Height 72 CM Width 60 CM"
        //        item5.flowerImage = UIImage(named: "WhiteFlower")!
        item5.flowerPrice = 224.42
        
        //        items.addItem(newItem: FlowersInfo(flowerName: "", flowerDetails: "", flowerImage: , flowerPrice: 100))
        
        let item6 = FlowerInfo(context: context)
        item6.flowerName = "sun Bouqeut"
        item6.flowerDetails = "sun Flowers Height 60 CM Width 15 CM"
        //        item6.flowerImage = UIImage(named: "sunFlower")!
        item6.flowerPrice = 100
        
        do{try! context.save()}
        
    }
    
    func fetchDataFromDB(){
        let request = FlowerInfo.fetchRequest()
        do {
            try!
            flower = context.fetch(request)
            itemsCollectionView.reloadData()
            bannerCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        startTimer()
        
        itemsCollectionView.delegate = self
        itemsCollectionView.dataSource = self
        bannerCollectionView.dataSource = self
        bannerCollectionView.delegate = self
        
        fillDBWithFlowers()
        itemsCollectionView.reloadData()
        bannerCollectionView.reloadData()
        
        
        // Clearn DB
        //        cleanDB()
        
        // Fetch all details from DB
        // Fill the tableview / collectionview cells
        // reload
        
    }
}

