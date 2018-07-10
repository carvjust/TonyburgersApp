//
//  StartViewController.swift
//  TonyburgersApp
//
//  Created by Justin Carver on 7/10/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MainScreenViewController.load()
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toMainScreen", sender: self)
        }
    }
}
