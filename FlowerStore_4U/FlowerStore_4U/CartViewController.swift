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
    
    var cartOrder = [FlowerInfo]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {return cartOrder.count}
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartItemTableView.dequeueReusableCell(withIdentifier: "cartCellID") as! CartTableCell
        
        cell.nameInCart.text = cartOrder[indexPath.row].flowerName
        cell.priceInCart.text = String(cartOrder[indexPath.row].flowerPrice)
        cell.imageInCart.image = UIImage(named:cartOrder[indexPath.row].flowerImage ?? " ")
        return cell
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        cartOrder.removeAll()
        do {
            for _ in 0...10 {
                if let item = cartOrder.last {
                    context.delete(item)
                }
                try!
                context.save()
                fetchDataFromDB()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartItemTableView.delegate = self
        cartItemTableView.dataSource = self
        fetchDataFromDB()
        cleanDB()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        fetchDataFromDB()
    }
    func fetchDataFromDB(){
        let request = FlowerInfo.fetchRequest()
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
    
    func cleanDB (){
        let clean = NSBatchDeleteRequest(fetchRequest: FlowerInfo.fetchRequest())
        do {try!
            context.execute(clean)} }
    
}


//NSBatchDeleteRequest(fetchRequest: cartOrder.fetchRequest())
