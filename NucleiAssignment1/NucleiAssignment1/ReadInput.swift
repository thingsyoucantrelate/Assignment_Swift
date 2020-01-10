//
//  ReadInput.swift
//  NucleiAssignment1
//
//  Created by Prateek K H on 10/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func read_input() -> (Item)
{
    var name:String?
    var type:String?
    var price:Double?
    var quantity:Int?
    var return_item:Item? = nil
    
    let type_checklist = ["raw","manufactured","imported"]
    
    print("Enter the name of the item")
    var name_validator:Bool = true
    
    while name_validator
    {
        name = readLine(strippingNewline: true)
        if name == nil
        {
            print("Enter a valid string for name")
        }
        else
        {
            name_validator = false
        }
    }
    
    print("Enter the type of the item (i.e raw/manufactured/imported)")
    var type_validator:Bool = true
    
    while type_validator
    {
        type = readLine(strippingNewline: true)
        
        if type != nil
        {
            if(!type_checklist.contains(type!))
            {
                print("Enter a valid type of item")
            }
            else
            {
                type_validator = false
            }
        }
        else
        {
            print("Enter a valid string for type")
        }
    }
    
    print("Enter the price of the item(Double)")
    var price_validator = true
    
    while price_validator
    {
        let price_string:String? = readLine(strippingNewline: true)
        
        if price_string != nil
        {
            price = Double(price_string!)
            if price != nil
            {
                if price! < 0.00
                {
                    print("Provided a negative value for price")
                    print("Enter a positive value")
                }
                else
                {
                    price_validator = false
                }
            }
            else
            {
                print("Enter a proper number for price")
            }
        }
    }
    
    print("Enter the quantity of the items(Int)")
    var quantity_validator:Bool = true
    
    while quantity_validator
    {
        let quant_str:String? = readLine(strippingNewline: true)
        
        if quant_str != nil
        {
            quantity = Int(quant_str!)
            if quantity != nil
            {
                if quantity! < 0
                {
                    quantity = 0
                }
                quantity_validator = false
            }
            else
            {
                print("Enter a valid integer for quantity")
            }
        }
        else
        {
            print("Enter a valid string for quantity")
        }
    }
   
    
    switch type!
    {
    case "raw":
        let raw_item = RawItem(name: name!, price: price!, quantity: quantity!, type: type!)
        let tax:Double = raw_item.calc_tax()
        print("The tax of the item is \(tax)")
        return_item = raw_item
    
    case "manufactured":
        let manufactured_item = ManufacturedItem(name: name!, price: price!, quantity: quantity!, type: type!)
        let tax:Double = manufactured_item.calc_tax()
        print("The tax of the item is \(tax)")
        return_item =  manufactured_item
    
    case "imported":
        let imported_item = ImportedItem(name: name!, price: price!, quantity: quantity!, type: type!)
        let tax:Double = imported_item.calc_tax()
        print("The tax of the item is \(tax)")
        return_item = imported_item
    
    default:
        print("You're not supposed to be here")
    }
    
    return return_item!
}
