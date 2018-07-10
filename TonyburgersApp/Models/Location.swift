//
//  Location.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/1/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import Foundation
class Location {
    private var orders: [Order]
    private let name: String
    private var hours: String
    private var takingNewOrders: Bool
    private let address: String
    
    init(orders: [Order], name: String, hours: String, takingNewOrders: Bool, address: String) {
        self.orders = orders
        self.name = name
        self.hours = hours
        self.takingNewOrders = takingNewOrders
        self.address = address
    }
    
    // get functions \\
    
    func getName() -> String {
        return self.name
    }
    
    func getHours() -> String {
        return self.hours
    }
    
    func getTakingNewOrders() -> Bool {
        return self.takingNewOrders
    }
    
    func getAddress() -> String {
        return self.address
    }
    
    // set functions \\
    
    func addOrder(order: Order) {
        self.orders.append(order)
    }
    
    func setTakingNewOrders(takingNewOrders: Bool) {
        self.takingNewOrders = takingNewOrders
    }
    
    func changeTakingNewOrders() {
        self.takingNewOrders = !self.takingNewOrders
    }
    
    func setHours(hours: String) {
        self.hours = hours
    }
}
