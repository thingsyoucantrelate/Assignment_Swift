//
//  importedItem.swift
//  NucleiAssignment1
//
//  Created by Prateek K H on 10/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

class ImportedItem:Item
{
    var name:String
    var price:Double
    var quantity:Int
    var type:String
    var final_price:Double!
    
    init(name:String, price:Double, quantity:Int, type:String)
    {
        self.name = name
        self.price = price
        self.quantity = quantity
        self.type = type
    }
    
    func calc_tax() -> Double {
        var tax:Double = 0
        tax = 0.1 * Double(price)
        if tax + Double(price) <= 100
        {
            tax += 5
        }
        else if (tax + Double(price) > 100) && (tax + Double(price) <= 200)
        {
            tax += 10
        }
        else if tax + Double(price) > 200
        {
            tax += tax * 0.05
        }
        else
        {
            print("Your'e not supposed to be here")
        }
        
        final_price = (tax + Double(price)) * Double(quantity)
        return tax
    }
}
