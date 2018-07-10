//
//  BurgerViewController.swift
//  Tonyburgers
//
//  Created by Justin Carver on 10/13/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class BurgerViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet var burgerSizeButton: UIButton!
    @IBOutlet var cheeseButton: UIButton!
    @IBOutlet var veggieButton: UIButton!
    @IBOutlet var sauceButton: UIButton!
    @IBOutlet var goodiesButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UIView.animate(withDuration: 0.5) {
            if segue.identifier == "toSizePopover" {
                let sourceRect = self.burgerSizeButton.imageView?.frame.insetBy(dx: 0, dy: 0)
                let popoverViewController = segue.destination as! PopoverViewController
                popoverViewController.popoverPresentationController?.sourceRect = sourceRect!
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController?.delegate = self
            }
            if segue.identifier == "toCheesePopover" {
                let sourceRect = self.cheeseButton.imageView?.frame.insetBy(dx: 0, dy: 0)
                let popoverViewController = segue.destination as! PopoverViewController
                popoverViewController.popoverPresentationController?.sourceRect = sourceRect!
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController?.delegate = self
            }
            if segue.identifier == "toVeggiesPopover" {
                let sourceRect = self.veggieButton.imageView?.frame.insetBy(dx: 0, dy: 0)
                let popoverViewController = segue.destination as! PopoverViewController
                popoverViewController.popoverPresentationController?.sourceRect = sourceRect!
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController?.delegate = self
            }
            if segue.identifier == "toSaucePopover" {
                let sourceRect = self.sauceButton.imageView?.frame.insetBy(dx: 0, dy: 0)
                let popoverViewController = segue.destination as! PopoverViewController
                popoverViewController.popoverPresentationController?.sourceRect = sourceRect!
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController?.delegate = self
            }
            if segue.identifier == "toGoodiesPopover"{
                let sourceRect = self.goodiesButton.imageView?.frame.insetBy(dx: 0, dy: 0)
                let popoverViewController = segue.destination as! PopoverViewController
                popoverViewController.popoverPresentationController?.sourceRect = sourceRect!
                popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
                popoverViewController.popoverPresentationController?.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
