//
//  CartViewController.swift
//  FlowerStore_4U
//
//  Created by Razan on 22/04/1443 AH.
//

import UIKit
import CoreData

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cartItemTableView: UITableView!
    
    var cartOrder = [CartInfo]()
    var addToCart = [FlowerInfo]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartOrder.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartItemTableView.dequeueReusableCell(withIdentifier: "cartCellID") as! CartTableCell
        let save = cartOrder[indexPath.row]
        cell.nameInCart.text = save.flowerNameInCart
        cell.priceInCart.text = String(save.flowerPriceInCart)
        cell.imageInCart.image = UIImage(named: save.flowerImageInCart ?? " ")
        return cell
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        for item in cartOrder {
            context.delete(item)
        }
        do {
            try! context.save()
        }
        fetchDataFromDB()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartItemTableView.delegate = self
        cartItemTableView.dataSource = self
        fetchDataFromDB()
    }
    
    override func viewWillAppear(_ animated: Bool){
        fetchDataFromDB()
        cartItemTableView.reloadData()
    }
    func fetchDataFromDB(){
        
        let request = CartInfo.fetchRequest()
        do {
            try!
            cartOrder = context.fetch(request)
            cartItemTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { (actionDelete, view,completionHandler) in
            
            let itemToDelet = self.cartOrder[indexPath.row]
            
            self.context.delete(itemToDelet)
            do{
                try self.context.save()
                
            } catch {
                
            }
            self.fetchDataFromDB()
        }
        return UISwipeActionsConfiguration (actions: [actionDelete])
    }
}
