//
//  CustomOrder.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 20/04/1443 AH.
//

import UIKit

class CustomOrder: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource{
    
    let roes = ["jouri roses - Red" , "jouri roses - White" , "jouri roses - Yellow"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roes[row]
    }
    

    @IBOutlet weak var chooseRose: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chooseRose.dataSource = self
        chooseRose.delegate = self
        // Do any additional setup after loading the view.
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

//extension UIViewController : UIPickerViewDelegate{
//
//
//
//}

