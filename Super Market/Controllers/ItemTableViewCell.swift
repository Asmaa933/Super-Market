//
//  ItemTableViewCell.swift
//  Super Market
//
//  Created by AsMaa on 4/15/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    
   
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
