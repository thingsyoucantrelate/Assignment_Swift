//
//  ReadDisplayDetails.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

let display_choices = [1,2,3,4]
let display_options = """

Sort by
1.Name
2.Age
3.Roll Number
4.Address

"""

let sort_choices = [1,2]
let sort_order = """

1.Ascending
2.Descending

"""

func readDisplayDetails() -> (inout [Student]) -> Void
{
    var display_choice: Int = 0
    var dchoice_str: String?
    
    var sort_choice: Int = 0
    var schoice_str: String?
    
    var returnFunction: (inout [Student]) -> Void
    
    dchoice_entry: while true
    {
        print(display_options)
        
        dchoice_str = readLine()
        
        if let temp_dchoice = dchoice_str
        {
            if let temp_dchoice_int = Int(temp_dchoice)
            {
                display_choice = temp_dchoice_int
                if display_choices.contains(display_choice)
                {
                    break dchoice_entry
                }
                else
                {
                    print("Enter a valid option")
                }
            }
            else
            {
                print("Enter a valid integer")
            }
        }
        else
        {
            print("Blank fields are not appreciated")
        }
    }
    
    schoice_entry: while true
    {
        print(sort_order)
        
        schoice_str = readLine()
        
        if let temp_schoice = schoice_str
        {
            if let temp_int_schoice = Int(temp_schoice)
            {
                sort_choice = temp_int_schoice
                if sort_choices.contains(sort_choice)
                {
                    break schoice_entry
                }
                else
                {
                    print("Enter a valid option")
                }
            }
            else
            {
                print("Enter a valid integer")
            }
        }
        else
        {
            print("Blank fields are not appreciated")
        }
    }
    
    switch display_choice
    {
    case 1:
        if sort_choice ==  1
        {
            returnFunction = sortByNameAsc
        }
        else
        {
            returnFunction = sortByNameDesc
        }
    case 2:
        if sort_choice == 1
        {
            returnFunction = sortByAgeAsc
        }
        else
        {
            returnFunction = sortByAgeDesc
        }
    case 3:
        if sort_choice == 1
        {
            returnFunction = sortByRollNoAsc
        }
        else
        {
            returnFunction = sortByRollNoDesc
        }
    case 4:
        if sort_choice == 1
        {
            returnFunction = sortByAddressAsc
        }
        else
        {
            returnFunction = sortByAddressDesc
        }
    default:
        print("Houston, we have another problem")
        returnFunction = sortByNameAsc
    }
    
    return returnFunction
}
