//
//  addViewController.swift
//  Super Market
//
//  Created by AsMaa on 4/15/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit
protocol AddViewControllerDelegate {
    func getNewItem(item: ItemsModel)
    
}

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet var categoriesPicker: UIView!
    

    @IBOutlet weak var imageNameTxt: UITextField!
    
    @IBOutlet weak var descTxt: UITextField!
    
    var categories = ["Computer" , "iPhone" , "Picture"]
    var selectedCat = ""
    
    var delegate: AddViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return categories.count

}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  categories[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCat = categories[row]
    }
    
    @IBAction func saveBtnTapped(_ sender: Any) {
   let newItem = ItemsModel(name: selectedCat, desc: descTxt.text ?? "" , imageName: imageNameTxt.text ?? "", isFruit: false)
        delegate?.getNewItem(item: newItem)
        self.navigationController?.popViewController(animated: true
        )
        
    }
}
