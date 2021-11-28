//
//  CustomOrder.swift
//  FlowerStore_4U
//
//  Created by Noura Alahmadi on 20/04/1443 AH.
//

import UIKit

class CustomOrder: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    let roes = ["jouri roses - Red" , "jouri roses - White" , "jouri roses - Yellow"]
    var customOrder = [FlowerInfo]()
    var pickerView = UIPickerView()
    var customImageName: String = ""
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        flowerTypeTextField.text = roes[row]
        flowerTypeTextField.resignFirstResponder()
    }
    
    func showPhotoAlert(){
        let alert = UIAlertController(title: "Take Photo From:", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.getPhoto(type: .camera)
        }))
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                self.getPhoto(type: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    present(alert, animated: true, completion: nil)
    
    }
    func getPhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard let imageCL = info[.originalImage] as? UIImage else {
            print("Image not Found")
            return
        }
        if let imageUrl = info[.imageURL] as? URL {
            customImageName = imageUrl.lastPathComponent
        }
        imageFromCL.image = imageCL
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {dismiss(animated: true, completion: nil)}
    
    func saveUserData() {
        let item = FlowerInfo (context: context)
        item.flowerPrice = Double(amountLBL.text!) ?? 0.0
        item.flowerName = flowerTypeTextField.text
        item.flowerImage = customImageName

        do{
            try! context.save()
            print("Custom data saved to CoreData")
        }
    }
    
    @IBOutlet weak var imageFromCL: UIImageView!
    @IBAction func tapOnImage(_ sender: Any) {
        showPhotoAlert()
    }
    
    
    @IBOutlet weak var clickOnPhoto: UILabel!
    
   
    @IBOutlet weak var flowerTypeTextField: UITextField!
    @IBOutlet weak var priceCostomLBL: UILabel!
    @IBOutlet weak var amountLBL: UILabel!
    @IBAction func stepperBottun(_ sender: UIStepper) {
        amountLBL.text = String(sender.value)
        priceCostomLBL.text = String((sender.value)*5)
    }
    
    
    @IBAction func addToCartCustomOrder(_ sender: Any) {
        saveUserData()
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        flowerTypeTextField.inputView = pickerView
        
       
    }
    
}
