//
//  CustomOrder.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 20/04/1443 AH.
//

import UIKit

class CustomOrder: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
//    var custom = FlowersList()
    let rose = ["jouri roses - Red" , "jouri roses - White" , "jouri roses - Yellow"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rose.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rose[row]
    }
    

    @IBOutlet weak var chooseRose: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chooseRose.dataSource = self
        chooseRose.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var PriceCostumLBL: UILabel!
    @IBOutlet weak var SrepperAmount: UILabel!
    
    @IBAction func StepperBottun(_ sender: UIStepper) {
        SrepperAmount.text = String(sender.value)
        PriceCostumLBL.text = String((sender.value)*5)
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


