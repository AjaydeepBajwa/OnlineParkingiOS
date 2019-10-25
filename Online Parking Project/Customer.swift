//
//  Customer.swift
//  Online Parking Project
//
//  Created by AJAY BAJWA on 2018-11-08.
//  Copyright © 2018 lambton. All rights reserved.
//

import Foundation
class Customer{
    var Name: String!
    var ContactNumber: String!
    var City: String!
    var PostalCode: String!
    var Email: String!
    var Password: String!
    var CarPlateNumber: String!
    var dateofbirth : String!
    var StreetAddress : String
    private static var customerList = [String: Customer]()
    
    init(){
        self.Name = ""
        self.ContactNumber = ""
        self.City = ""
        self.PostalCode = ""
        self.Email = ""
        self.Password = ""
        self.CarPlateNumber = ""
        self.dateofbirth = ""
        self.StreetAddress = ""
    }
    
    init(_ Name: String, _ ContactNumber: String, _ City: String, _ PostalCode: String, _ Email: String, _ Password: String, _ CarPlateNumber: String, _ dateofbirth: String, _ StreetAddress : String){
        self.Name = Name
        self.ContactNumber = ContactNumber
        self.City = City
        self.PostalCode = PostalCode
        self.Email = Email
        self.Password = Password
        self.CarPlateNumber = CarPlateNumber
        self.dateofbirth = dateofbirth
        self.StreetAddress = StreetAddress
        
    }
    
    static func addCustomer(cust: Customer) -> Bool{
        if self.customerList[cust.Email] == nil{
            self.customerList[cust.Email] = cust
            return true
        }else{
            return false
        }
    }
    
    static func getCustomerByID(custEmail: String) -> Customer{
        
        if self.customerList[custEmail] != nil{
            return self.customerList[custEmail]!
        }
        return Customer()
    }
    
    static func getAllCustomers() -> [String:Customer] {
        return customerList
    }
}
