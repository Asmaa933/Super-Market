//
//  SecondViewController.swift
//  Super Market
//
//  Created by AsMaa on 4/15/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, AddViewControllerDelegate {
var itemsArray = [ItemsModel]()
    
    @IBOutlet weak var secondTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        secondTableView.tableFooterView = UIView()
    }
    func getNewItem(item: ItemsModel) {
        itemsArray.append(item)
        secondTableView.reloadData()
    }
    
    @IBAction func addBtnTapped(_ sender: Any) {
        guard let addVC = storyboard?.instantiateViewController(withIdentifier: addViewControllerID) as? AddViewController else{
            print("cannotfind this class")
            return
        }
        addVC.delegate = self
        self.navigationController?.pushViewController(addVC, animated: true)
    }
}
extension SecondViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondViewCellID , for: indexPath) as? ItemTableViewCell else
        {
            print("Cannot find the cell")
            return UITableViewCell()
        }
    cell.nameLabel.text = itemsArray[indexPath.row].name
        cell.descLabel.text = itemsArray[indexPath.row].desc
        cell.imageView?.image = UIImage(named: itemsArray[indexPath.row].imageName)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            print("delete")
            itemsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
}
