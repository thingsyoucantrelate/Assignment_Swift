//
//  main.swift
//  NucleiAssignment1
//
//  Created by Prateek K H on 10/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

var flag:Bool = true
var item_array = [Item]()

while flag
{
    var choice:Int = 0
    var input_choice:Bool = true
    let display_string = """

    1.Enter the details of an item
    2.Display all the items
    3.Exit

    """
    
    print("Choose an option")
    print(display_string)
    
    //var choice:Int?
    
    while input_choice
    {
        let choice_string = readLine(strippingNewline: true)
        if let choice_str = choice_string
        {
            if let choice_int = Int(choice_str)
            {
                choice = choice_int
                input_choice = false
            }
            else
            {
                print("Enter a valid value for choice")
            }
        }
        else
        {
            print("Enter a valid value for choice")
        }
    }
    
    
    switch choice
    {
    case 1:
        let temp_item:Item = read_input()
        item_array.append(temp_item)
        
    case 2:
        if item_array.isEmpty
        {
            print("There are no items in the cart")
        }
        else
        {
            print("Printing items...")
            print("Name\t\tPrice\t\tType\t\tQuantity\t\tFinal Price")
            for temp_item in item_array
            {
                print("\(temp_item.name)\t\t\(temp_item.price)\t\t\(temp_item.type)\t\t\(temp_item.quantity)\t\t\(temp_item.final_price!)")
            }
        }
    case 3:
        print("Exiting...")
        flag = false
        item_array.removeAll()
    default:
        print("Enter a proper value for choice (1/2/3)")
    }
}
