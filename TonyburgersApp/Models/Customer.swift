//
//  Customer.swift
//  Tonyburgers
//
//  Created by Justin Carver on 6/1/18.
//  Copyright © 2018 Justin Carver. All rights reserved.
//

import Foundation
class Customer {
    private let kOrders = "Orders"
    private let kEmail = "Email"
    private let kName = "Name"
    private let kPhone = "Phone"
    private let kBirthday = "Birthday"
    
    private var orders: [Order]
    private var email: String
    private var name: String
    private var phone: Int
    private var birthday: Date
    
    init(orders: [Order], email: String, name: String, phone: Int, birthday: Date) {
        self.orders = orders
        self.email = email
        self.name = name
        self.phone = phone
        self.birthday = birthday
    }
    
    init?(dictionary: [String: Any]) {
        guard let orders = dictionary[kOrders] as? [Order],
        let email = dictionary[kEmail] as? String,
        let name = dictionary[kName] as? String,
        let phone = dictionary[kPhone] as? Int,
        let birthday = dictionary[kBirthday] as? Date
        else { return nil }
        
        self.orders = orders
        self.email = email
        self.name = name
        self.phone = phone
        self.birthday = birthday
    }
    
    var jsonValue: [String: Any] {
        if self.orders.isEmpty {
            return [kEmail: self.email, kPhone: "\(self.phone)", kName: self.name, kBirthday: self.birthday.description]
        } else {
            return [kOrders: self.orders, kEmail: self.email, kPhone: "\(self.phone)", kName: self.name, kBirthday: self.birthday.description]
        }
    }
    
    var jsonData: Data? {
        return try! JSONSerialization.data(withJSONObject: self.jsonValue, options: .prettyPrinted)
    }
    
    // get methods \\
    
    func getOrders() -> [Order] {
        return self.orders
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPhone() -> Int {
        return self.phone
    }
    
    func getBirthday() -> Date {
        return self.birthday
    }
    
    // set methods \\
    
    func addOrder(order: Order) {
        self.orders.append(order)
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func setBirthday(birthday: Date) {
        self.birthday = birthday
    }
    
    func setPhone(phone: Int) {
        self.phone = phone
    }
}
