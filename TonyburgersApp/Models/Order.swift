//
//  Order.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/1/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import Foundation

class Order {
    
    private var items: [Food]
    private var name: String
    private let customer: Customer
    private var pickupTime: Date
    private let orderTime: Date
    private var price: Int
    private var completed: Bool
    private var accepted: Bool
    
    init(items: [Food], name: String, customer: Customer, pickupTime: Date, orderTime: Date, price: Int, completed: Bool = false, accepted: Bool = false) {
        self.items = items
        self.name = name
        self.customer = customer
        self.pickupTime = pickupTime
        self.orderTime = orderTime
        self.price = price
        self.completed = completed
        self.accepted = accepted
    }
    
    // get methods \\
    
    func getItems() -> [Food] {
        return self.items
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getCustomer() -> Customer {
        return self.customer
    }
    
    func getPickupTime() -> Date {
        return self.pickupTime
    }
    
    func getOrderTime() -> Date {
        return self.orderTime
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    func getCompleted() -> Bool {
        return self.completed
    }
    
    func getAccepted() -> Bool {
        return self.accepted
    }
    
    // set methods \\
    
    func markAsCompleted() {
        self.completed = true
    }
    
    func markAsAccepted() {
        self.accepted = true
    }
    
    func markAsDenied() {
        self.accepted = false
    }
    
    func addItem(item: Food) {
        self.items.append(item)
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setPickupTime(time: Date) {
        self.pickupTime = time
    }
    
    func calcPrice() {
        var price = 0
        for food in items {
            price += food.getPrice()
        }
        self.price = price
    }
}
