//
//  CartViewController.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/28/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var itemsToGetAdd: [Int: Food] = [:]
    var food: Food?
    
    @IBAction func CheckOutButtonTapped(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedFood.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? CartItemCell else { return CartItemCell() }
        if indexPath.row < savedFood.count {
            let food = savedFood[indexPath.row]
            cell.updateCellWith(category: food.getCategory(), name: food.getDisplayName(), price: food.getPrice())
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row < savedFood.count {
            return 150
        }
        return 25
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        food = savedFood[indexPath.row]
        switch (food?.getCategory().rawValue) {
        case Category.Burger.rawValue:
            self.performSegue(withIdentifier: "toBurgerViewFromCart", sender: self)
        case Category.Salad.rawValue:
            self.performSegue(withIdentifier: "toSaladViewFromCart", sender: self)
        case Category.Side.rawValue:
            self.performSegue(withIdentifier: "toSideViewFromCart", sender: self)
        case Category.Shake.rawValue:
            self.performSegue(withIdentifier: "toShakeViewFromCart", sender: self)
        case Category.Kids.rawValue:
            self.performSegue(withIdentifier: "toKidsViewFromCart", sender: self)
        case Category.Drink.rawValue:
            self.performSegue(withIdentifier: "toDrinkViewFromCart", sender: self)
        default:
            print("Shit")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            if indexPath.row < savedFood.count {
                savedFood.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UIView.animate(withDuration: 0.5) {
            
            if segue.identifier == "toBurgerViewFromCart" {
                let nextview = segue.destination as! ItemsTableViewController
                let sizes = [
                    Ingredient.init(name: "Small Tony", category: Category.Burger, price: 499),
                    Ingredient.init(name: "Double Small Tony", category: Category.Burger, price: 678),
                    Ingredient.init(name: "Big-T", category: Category.Burger, price: 599),
                    Ingredient.init(name: "Double Big-T", category: Category.Burger, price: 818),
                    Ingredient.init(name: "Grilled Chicken", category: Category.Burger, price: 575),
                    Ingredient.init(name: "Veggie Burger", category: Category.Burger, price: 595)]
                let cheeses = [
                    Ingredient.init(name: "American", category: Category.Burger, price: 79),
                    Ingredient.init(name: "Chedder", category: Category.Burger, price: 79),
                    Ingredient.init(name: "Swiss", category: Category.Burger, price: 79),
                    Ingredient.init(name: "Pepper Jack", category: Category.Burger, price: 79)]
                let goodies = [Ingredient.init(name: "Soft Fried Egg", category: Category.Burger, price: 79),
                               Ingredient.init(name: "Hard Fried Egg", category: Category.Burger, price: 79),
                               Ingredient.init(name: "Mushrooms", category: Category.Burger, price: 49),
                               Ingredient.init(name: "Bacon", category: Category.Burger, price: 99),
                               Ingredient.init(name: "Onion Strings", category: Category.Burger, price: 99)]
                let sauces = [Ingredient.init(name: "Tony Sauce", category: Category.Burger),
                              Ingredient.init(name: "Ketchup", category: Category.Burger),
                              Ingredient.init(name: "Mustard", category: Category.Burger),
                              Ingredient.init(name: "Mayo", category: Category.Burger),
                              Ingredient.init(name: "Ranch", category: Category.Burger),
                              Ingredient.init(name: "Southern Ranch", category: Category.Burger),
                              Ingredient.init(name: "BBQ", category: Category.Burger)]
                let veggies = [Ingredient.init(name: "Lettuce", category: Category.Burger),
                               Ingredient.init(name: "Tomato", category: Category.Burger),
                               Ingredient.init(name: "Raw Onions", category: Category.Burger),
                               Ingredient.init(name: "Grilled Onions", category: Category.Burger),
                               Ingredient.init(name: "Pickles", category: Category.Burger),
                               Ingredient.init(name: "Jalapenos", category: Category.Burger)]
                nextview.sectionTitles = ["Size", "Cheese", "Goodies", "Sauces", "Veggies"]
                nextview.displayNameSections = [0]
                nextview.displayNames = [""]
                nextview.sections = [sizes, cheeses, goodies, sauces, veggies]
                nextview.singleSelectionSections = [0]
                nextview.requiredSections = [0]
                nextview.selectedIndexPaths = self.food!.getSelectedIndexPaths()
                nextview.food = self.food
                
            } else if segue.identifier == "toSaladViewFromCart" {
                let nextview = segue.destination as! ItemsTableViewController
                let sizes =
                    [Ingredient.init(name: "Small", category: Category.Salad, price: 699),
                     Ingredient.init(name: "Large", category: Category.Salad, price: 899)]
                let salads = [Ingredient.init(name: "Laura's Fav", category: Category.Salad),
                              Ingredient.init(name: "Apples and Walnuts", category: Category.Salad),
                              Ingredient.init(name: "T-Wedge", category: Category.Salad),
                              Ingredient.init(name: "Sam's Southest", category: Category.Salad)]
                let extras = [Ingredient.init(name: "Grilled Chicken", category: Category.Salad)]
                nextview.sectionTitles = ["Size", "Salad", "Extras"]
                nextview.displayNameSections = [0, 1]
                nextview.displayNames = ["", ""]
                nextview.sections = [sizes, salads, extras]
                nextview.singleSelectionSections = [0, 1]
                nextview.requiredSections = [0, 1]
                nextview.food = self.food
                nextview.selectedIndexPaths = self.food!.getSelectedIndexPaths()

            } else if segue.identifier == "toSidesViewFromCart" {
                let nextview = segue.destination as! ItemsTableViewController
                let sides =
                    [Ingredient.init(name: "Small Fry", category: Category.Side, price: 289),
                     Ingredient.init(name: "Large Fry", category: Category.Side, price: 369),
                     Ingredient.init(name: "Onion Rings", category: Category.Side, price: 399)]
                nextview.sectionTitles = ["Sides"]
                nextview.displayNameSections = [0]
                nextview.displayNames = [""]
                nextview.sections = [sides]
                nextview.singleSelectionSections = [0]
                nextview.requiredSections = [0]
                nextview.food = self.food
                nextview.selectedIndexPaths = self.food!.getSelectedIndexPaths()

            } else if segue.identifier == "toShakesViewFromCart" {
                let nextview = segue.destination as! ItemsTableViewController
                let flavors = [Ingredient.init(name: "Vanilla", category: Category.Shake, price: 49),
                               Ingredient.init(name: "Chocolate", category: Category.Shake, price: 49),
                               Ingredient.init(name: "Oreo", category: Category.Shake, price: 49),
                               Ingredient.init(name: "Strawberry", category: Category.Shake, price: 49),
                               Ingredient.init(name: "Strawberry Coconut", category: Category.Shake, price: 49),
                               Ingredient.init(name: "Carmel", category: Category.Shake, price: 49),
                               Ingredient.init(name: "Coconut", category: Category.Shake, price: 49)]
                let extras = [Ingredient.init(name: "No Whip", category: Category.Shake),
                              Ingredient.init(name: "Malt", category: Category.Shake, price: 49)]
                nextview.sectionTitles = ["Flavors", "Extras"]
                nextview.displayNameSections = [0]
                nextview.displayNames = ["", ""]
                nextview.displayNames[1] = "Shakes"
                nextview.sections = [flavors, extras]
                nextview.food = self.food
                nextview.selectedIndexPaths = self.food!.getSelectedIndexPaths()

            } else if segue.identifier == "toKidsViewFromCart" {
                let nextview = segue.destination as! ItemsTableViewController
                let choices = [Ingredient.init(name: "Hot Dog", category: Category.Kids),
                               Ingredient.init(name: "Tiny Tony", category: Category.Kids),
                               Ingredient.init(name: "Grilled Cheese", category: Category.Kids),
                               Ingredient.init(name: "Chicken Nuggets", category: Category.Kids)]
                let meals = [Ingredient.init(name: "Kids Meal", category: Category.Kids, price: 200),
                             Ingredient.init(name: "No Meal", category: Category.Kids)]
                nextview.sectionTitles = ["Selection", "Meal?"]
                nextview.sections = [choices, meals]
                nextview.displayNameSections = [0]
                nextview.singleSelectionSections = [0, 1]
                nextview.food = self.food
                nextview.selectedIndexPaths = self.food!.getSelectedIndexPaths()
            }
        }
    }
}
