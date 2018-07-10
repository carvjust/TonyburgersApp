//
//  CartItemCell.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/28/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import UIKit

class CartItemCell: UITableViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var amountStepper: UIStepper!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var amountLabel: UILabel!
    
    var price: Double = 0
    var amount: Double = 1 {
        didSet {
            self.updateCellForNewAmount()
        }
    }
    
    func updateCellWith(category: Category, name: String, price: Int) {
        if category == Category.Burger {
            itemImageView.image = #imageLiteral(resourceName: "Burger Icon-1")
        } else if category == Category.Salad {
            itemImageView.image = #imageLiteral(resourceName: "Salad Icon")
        } else if category == Category.Side {
            itemImageView.image = #imageLiteral(resourceName: "Fries Icon")
        } else if category == Category.Drink {
            
        } else if category == Category.Kids {
            itemImageView.image = #imageLiteral(resourceName: "Kids Meal Icon")
        } else if category == Category.Shake {
            itemImageView.image = #imageLiteral(resourceName: "Shake Icon")
        }
        self.nameLabel.text = name
        self.price = Double(price)
        updateCellForNewAmount()
    }
    
    func updatePriceLabel() {
        self.priceLabel.text = "$\((price / 100) * amount)"
    }
    
    func updateAmountLabel() {
        self.amountLabel.text = "\(Int(amount))"
    }
    
    func updateCellForNewAmount() {
        updatePriceLabel()
        updateAmountLabel()
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        amount = sender.value
    }
}
