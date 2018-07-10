//
//  BurgerToppingsTableViewController.swift
//  Tonyburgers
//
//  Created by Justin Carver on 11/17/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    var sectionTitles: [String] = []
    var sections: [[Ingredient]] = []
    var displayNameSections: [Int] = []
    var lockedSections: [Int] = []
    var requiredSections: [Int] = []
    var selectedRows: [Int: Int] = [:]
    var singleSelectionSections: [Int] = []
    var displayNames: [String] = []
    var indexIfEditing = -1
    var food: Food?
    
    @IBAction func CancelButtonTapped(_ sender: Any) {
        if !(selectedIndexPaths.isEmpty) {
            let alert = UIAlertController.init(title: "Are you sure you would like to cancel?", message: nil, preferredStyle: .alert)
            let yesAction = UIAlertAction.init(title: "Yes", style: .default) { (_) in
                self.selectedIndexPaths = []
                self.navigationController?.popViewController(animated: true)
            }
            let noAction = UIAlertAction.init(title: "No", style: .cancel, handler: nil)
            alert.addAction(yesAction)
            alert.addAction(noAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func SaveButtonTapped(_ sender: Any) {
        let alert = UIAlertController.init(title: "Would you like to save this item to your cart?", message: nil, preferredStyle: .alert)
        let yesAction = UIAlertAction.init(title: "Yes", style: .default) { (_) in
            guard let food = self.food else { return }
            for section in self.requiredSections {
                if self.selectedRows == [:] {
                    let notCompletedAlert = UIAlertController.init(title: "You must fill in at least the required sections to add to cart", message: "Please retry after filling in required sections", preferredStyle: .alert
                    )
                    let okAction = UIAlertAction.init(title: "OK", style: .cancel) { (_) in
                        return
                    }
                    notCompletedAlert.addAction(okAction)
                    self.present(notCompletedAlert, animated: true, completion: nil)
                }
                if self.selectedRows[section] == nil || self.selectedRows[section] == 0 {
                    let notCompletedAlert = UIAlertController.init(title: "All required sections are not filled in", message: "Please retry after filling in required sections", preferredStyle: .alert
                    )
                    let okAction = UIAlertAction.init(title: "OK", style: .cancel) { (_) in
                        return
                    }
                    notCompletedAlert.addAction(okAction)
                    self.present(notCompletedAlert, animated: true, completion: nil)
                }
            }
            var name: String = ""
            for string in self.displayNames {
                name += string + " "
            }
            food.setSelectedIndexPaths(indexPaths: self.selectedIndexPaths)
            food.setDisplayName(name: name)
            if self.indexIfEditing >= 0 {
                savedFood[self.indexIfEditing] = food
            } else {
                savedFood.append(food)
            }
            self.selectedIndexPaths = []
            self.navigationController?.popViewController(animated: true)
        }
        let noAction = UIAlertAction.init(title: "Not Yet", style: .cancel, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    var selectedIndexPaths: [IndexPath] = [] /*{
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "selectedIndexPathsUpdated"), object: selectedIndexPaths)
        }
    }
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        guard food != nil else {
            let alert = UIAlertController.init(title: "Could not load item, please try agian", message: nil, preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "Go Back", style: .cancel, handler: { (_) in
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
    }
    
    //==========================================================================
    //  MARK: - Notifications
    //==========================================================================
    
    func resetSelectedIndexPaths() {
        self.selectedIndexPaths = []
    }
    
    func toppingCellTappedToDelete(ingredient: Ingredient, section: Int) {
        if displayNameSections.contains(section) {
            displayNames[section] = ""
        }
        if lockedSections.contains(section) {
            lockedSections.remove(at: lockedSections.index(of: section)!)
        }
        if let selectionKey = selectedRows[section] {
            selectedRows[section] = selectionKey - 1
        }
        food!.deleteIngredient(ingredient: ingredient)
    }
    
    func toppingCellTappedToAdd(ingredient: Ingredient, section: Int) {
        if displayNameSections.contains(section) {
            displayNames[section] = ingredient.getName()
        }
        if singleSelectionSections.contains(section) {
            lockedSections.append(section)
        }
        if let sectionKey = selectedRows[section] {
            selectedRows[section] = sectionKey + 1
        } else {
            selectedRows[section] = 1;
        }
        food!.addIngredient(ingredient: ingredient)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle = sectionTitles[section]
        if requiredSections.contains(section) {
            sectionTitle += " (Required)"
        }
        return sectionTitle
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ToppingCell else { return }

        let ingredient = sections[indexPath.section][indexPath.row]
        // if selected index path already contains the index path remove the topping else add the topping
        
        guard !(lockedSections.contains(indexPath.section)) || selectedIndexPaths.contains(indexPath) else {
            let alert = UIAlertController.init(title: "Cannot select two of these choices at once", message: "", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        
        if selectedIndexPaths.contains(indexPath) {
            toppingCellTappedToDelete(ingredient: ingredient, section: indexPath.section)
            cell.updateCellWith(Image: #imageLiteral(resourceName: "Add Contact"))
            guard let indexOfIndexPath = selectedIndexPaths.index(of: indexPath) else { return }
            selectedIndexPaths.remove(at: indexOfIndexPath)
        } else {
            toppingCellTappedToAdd(ingredient: ingredient, section: indexPath.section)
            cell.updateCellWith(Image: #imageLiteral(resourceName: "Remove Contact"))
            selectedIndexPaths.append(indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let actualCell = cell as? ToppingCell else { return }
        if selectedIndexPaths.contains(indexPath) {
            actualCell.updateCellWith(Image: #imageLiteral(resourceName: "Remove Contact"))
        } else {
            actualCell.updateCellWith(Image: #imageLiteral(resourceName: "Add Contact"))
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toppingCell", for: indexPath) as? ToppingCell else { return ToppingCell() }
        
        var ingredient: Ingredient
        ingredient = sections[indexPath.section][indexPath.row]
        cell.updateCellWith(ingredient: ingredient)
        
        return cell
    }
}
