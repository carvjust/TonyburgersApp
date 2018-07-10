//
//  Ingredient.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/1/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import Foundation
class Ingredient {
    
    private let name: String
    private let category: Category
    private var isSoldOut: Bool
    private var price: Int
    
    init(name: String, category: Category, isSoldOut: Bool = false, price: Int = 0) {
        self.name = name
        self.category = category
        self.isSoldOut = isSoldOut
        self.price = price
    }
    
    // get functions \\
    
    func getName() -> String {
        return self.name
    }
    
    func getCategory() -> Category {
        return self.category
    }
    
    func getIsSoldOut() -> Bool {
        return self.isSoldOut
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    // set fuctions \\
    
    func setIsSoldOut(isSoldOut: Bool) {
        self.isSoldOut = isSoldOut
    }
    
    func setPrice(price: Int) {
        self.price = price
    }
}
