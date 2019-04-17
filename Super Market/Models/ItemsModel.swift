//
//  ItemsModel.swift
//  Super Market
//
//  Created by AsMaa on 4/15/19.
//  Copyright © 2019 AsMaa. All rights reserved.
//

import Foundation
class ItemsModel{
    var name: String
    var desc: String
    var imageName: String
    var isFruit: Bool
    init(name: String , desc: String , imageName :String, isFruit: Bool) {
        self.name = name
        self.desc = desc
        self.imageName = imageName
        self.isFruit = isFruit
    }
}
