//
//  MainScreenViewController.swift
//  Tonyburgers
//
//  Created by Justin Carver on 10/12/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    var currentHeldSelectedCategory: Category? {
        willSet(newCategory) {
            if currentHeldSelectedCategory != nil && currentHeldSelectedCategory != newCategory {
                let alert = UIAlertController.init(title: "Do you wish to discard your current item?", message: "You will have to reenter your changes", preferredStyle: .alert)
                let yesAction = UIAlertAction.init(title: "Yes", style: .default) { (_) in
                    self.currentHeldSelectedCategory = nil
                    self.selectedIndexPaths.removeAll()
                }
                let noAction = UIAlertAction.init(title: "No", style: .cancel, handler: nil)
                alert.addAction(yesAction)
                alert.addAction(noAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    var selectedIndexPaths: [IndexPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageview = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imageview.contentMode = .scaleAspectFit
        imageview.frame = CGRect(x: 0, y: 0, width: 50, height: 45)
        navigationItem.titleView = imageview
        NotificationCenter.default.addObserver(self, selector: #selector(updateSelectedIndexPaths(notification:)), name: NSNotification.Name(rawValue: "selectedIndexPathsUpdated"), object: nil)
    }
    
    @objc func updateSelectedIndexPaths(notification: Notification) {
        let indexPaths = notification.object as? [IndexPath]
        selectedIndexPaths = indexPaths!
    }
    
    @IBOutlet var shakesButton: UIButton!
    @IBOutlet var friesButton: UIButton!
    @IBOutlet var justForKidsButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UIView.animate(withDuration: 0.5) {
            
            if segue.identifier == "toBurgerView" {
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
                nextview.food = Food.init(category: Category.Burger, ingredients: [], price: 0, notes: "")
                
            } else if segue.identifier == "toSaladView" {
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
                nextview.food = Food.init(category: Category.Salad, ingredients: [], price: 0, notes: "")
                
            } else if segue.identifier == "toSidesView" {
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
                nextview.food = Food.init(category: Category.Side, ingredients: [], price: 0, notes: "")
                
            } else if segue.identifier == "toShakesView" {
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
                nextview.food = Food.init(category: Category.Shake, ingredients: [], price: 450, notes: "")
                
            } else if segue.identifier == "toKidsView" {
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
                nextview.food = Food.init(category: Category.Kids, ingredients: [], price: 399, notes: "")
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
