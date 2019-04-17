//
//  ViewController.swift
//  Super Market
//
//  Created by AsMaa on 4/14/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class SuperMarketViewController : UIViewController{
    var items = [ItemsModel]()
    //var items =  ["KFC","Kabab", "Koshary" , "Banana", "Mango" , "Watermelon"]
    var fastFood = [ItemsModel]()
    var fruits = [ItemsModel]()
    var sections = ["Fast Food" ,  "Fruits "]
    
    @IBOutlet weak var superMarketTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
        fillArray()
        superMarketTable.tableFooterView = UIView()
        
    }
    func updateUI(){
        superMarketTable.delegate = self
        superMarketTable.dataSource = self
        items.append(ItemsModel(name: "KFC", desc: "KFC Wooow", imageName: "KFC" , isFruit: false))
        items.append(ItemsModel(name: "Salad", desc: "Kabab and salta ", imageName: "Salad", isFruit: false))
        items.append(ItemsModel(name: "Koshary", desc: "Koshary Oooooh", imageName: "Koshary", isFruit: false))
        items.append(ItemsModel(name: "Banana", desc: "Banana useful", imageName: "Banana", isFruit: true))
        items.append(ItemsModel(name: "Mango", desc: "Mango sweet ", imageName: "Mango", isFruit: true))
        items.append(ItemsModel(name: "Watermelon", desc: "Watermelon summer fruit ", imageName: "Watermelon", isFruit: true))
    }
    func fillArray(){
        for item in items{
            item.isFruit ? fruits.append(item) : fastFood.append(item)
        }
    }
    
    @IBAction func barBtnTapped(_ sender: Any) {
        
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: secondViewControllerID) as? SecondViewController else {
            print("Cannot find this VC")
            return
        }
        secondVC.itemsArray = items
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}
extension SuperMarketViewController :UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return fastFood.count
        }else{
            return fruits.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstViewCellID , for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text =  fastFood[indexPath.row].name
        }else {
            cell.textLabel?.text = fruits[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
        //            if section == 0{
        //                return sections[0]
        //            }else{
        //                return sections[1]
        //   }
    }
}

