//
//  ToppingCell.swift
//  Tonyburgers
//
//  Created by Justin Carver on 11/17/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class ToppingCell: UITableViewCell {
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var contactImageView: UIImageView!
    @IBOutlet var toppingLabel: UILabel!
    
    func updateCellWith(ingredient: Ingredient) {
        toppingLabel.text = ingredient.getName()
        let price = Double(ingredient.getPrice())
        if price == 0 {
            priceLabel.text = ""
        } else {
            if ("\(price / 100)").count == 3 {
                priceLabel.text = "$" + "\(price / 100)0"
            } else {
                priceLabel.text = "$" + "\(price / 100)"
            }
        }
    }
    
    func updateCellWith(Image: UIImage) {
        contactImageView.image = Image
    }
}
