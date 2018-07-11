//
//  AppDelegate.swift
//  TonyburgersApp
//
//  Created by Justin Carver on 7/10/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import UIKit
import Firebase

var currentCustomer = Customer.init(orders: [], email: "15jcarver202@gmail.com", name: "Justin", phone: 8019890994, birthday: Date.init())
var savedFood: [Food] = []

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let databaseRef = Database.database().reference()
        databaseRef.setValue([UUID.init().uuidString: currentCustomer.jsonValue])
        return true
    }
}

