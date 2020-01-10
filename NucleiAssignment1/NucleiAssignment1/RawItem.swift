//
//  rawItem.swift
//  NucleiAssignment1
//
//  Created by Prateek K H on 10/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

class RawItem:Item
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
        tax = Double(price) * (0.125)
        final_price = (tax + Double(price)) * Double(quantity)
        return tax
    }
}
