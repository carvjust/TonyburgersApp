//
//  AppDelegate.swift
//  TonyburgersApp
//
//  Created by Justin Carver on 7/10/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import UIKit

var currentCustomer = Customer.init(orders: [], email: "", name: "", phone: 1, birthday: Date.init())
var savedFood: [Food] = []

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        return true
    }
}

