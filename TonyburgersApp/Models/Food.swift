//
//  Food.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/1/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import Foundation
class Food {
    
    private var customerName: String
    private var displayName: String
    private let category: Category
    private var ingredients: [Ingredient]
    private var price: Int
    private var notes: String
    private var selectedIndexPaths: [IndexPath] = []
    
    init(customerName: String = currentCustomer.getName(), displayName: String = "", category: Category, ingredients: [Ingredient], price: Int, notes: String) {
        self.customerName = customerName
        self.displayName = displayName
        self.category = category
        self.ingredients = ingredients
        self.price = price
        self.notes = notes
    }
    /*
    required convenience init(coder aDecoder: NSCoder) {
        let customerName = aDecoder.decodeOBject(forKey: "customerName") as! String
        let displayName = aDecoder.decodeObject(forKey: "displayName") as! String
        let category = aDecoder.decodeObject(forKey: "category") as! Category
        let ingredients =
        self.init(customerName: customerName, displayName: displayName
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(shortname, forKey: "shortname")
    }
    */
    func getCustomerName() -> String {
        return self.customerName
    }
    
    func getDisplayName() -> String {
        return self.displayName
    }
    
    func getCategory() -> Category {
        return self.category
    }
    
    func getIngredients() -> [Ingredient] {
        return self.ingredients
    }
    
    func getPrice() -> Int {
        if self.price <= 0 {
            self.calcPrice()
        }
        return self.price
    }
    
    func getSelectedIndexPaths() -> [IndexPath] {
        return selectedIndexPaths
    }
    
    private func calcPrice() {
        var total: Int = 0
        for ingredient in ingredients {
            total += ingredient.getPrice()
        }
        self.price += total
    }
    
    func setDisplayName(name: String) {
        self.displayName = name
    }
    
    func setSelectedIndexPaths(indexPaths: [IndexPath]) {
        self.selectedIndexPaths = indexPaths
    }
    
    func addIngredient(ingredient: Ingredient) {
        self.ingredients.append(ingredient)
    }
    
    func deleteIngredient(ingredient: Ingredient) {
        var x = 0
        for topping in self.ingredients {
            if topping.getName() == ingredient.getName() {
                ingredients.remove(at: x)
            }
            x += 1
        }
    }
}
