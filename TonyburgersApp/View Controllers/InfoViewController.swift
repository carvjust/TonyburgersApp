//
//  InfoViewController.swift
//  Tonyburgers
//
//  Created by Justin Carver on 10/14/16.
//  Copyright © 2016 Justin Carver. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, changeViewHeightDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageview = UIImageView(image: #imageLiteral(resourceName: "Logo"))
        imageview.contentMode = .scaleAspectFit
        imageview.frame = CGRect(x: 0, y: 0, width: 50, height: 45)
        navigationItem.titleView = imageview
        LocationsTableViewController.viewHeightDelegate = self
        changeViewHeight(allCellsHidden: true)
    }
    
    func changeViewHeight(allCellsHidden: Bool) {
        if allCellsHidden == true {
            self.tabelViewHeightConstraint.constant = 218
        } else {
            self.tabelViewHeightConstraint.constant = 410
        }
    }
    
    // MARK: - Actions
    
    @IBAction func onlineOrderButtonTapped() {
        if let url = URL(string: "http://tonyburgers.kulacart.site") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func ContactButtonTapped() {
        let toEmail = "manager@tonyburgers.com"
        let urlString = "mailto:\(toEmail)"
        if let url = URL(string: urlString) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func applyButtonTapped() {
        if let url = URL(string: "http://www.tonyburgers.com/employment") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func facebookButtonPressed() {
        let fbUrl = URL(string: "fb://page/Tonyburgers-74907382331/")
        if UIApplication.shared.canOpenURL(fbUrl!) {
            UIApplication.shared.open(fbUrl!)
        } else {
            if let url = URL(string: "https://www.facebook.com/Tonyburgers-74907382331/") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func twitterButtonPressed() {
        if let url = URL(string: "https://twitter.com/Tonyburgers") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func instagramButtonPressed() {
        let instagramurl = URL(string: "instagram://user?username=tonyburgers_")
        if UIApplication.shared.canOpenURL(instagramurl!) {
            UIApplication.shared.open(instagramurl!)
        } else {
            if let url = URL(string: "https://www.instagram.com/tonyburgers_/") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBOutlet var tabelViewHeightConstraint: NSLayoutConstraint!
}

