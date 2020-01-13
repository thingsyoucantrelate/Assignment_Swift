//
//  ReadDeletionDetails.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation


func readDeletionDetails() -> Int
{
    var roll_to_delete: Int = 0
    var roll_str: String?
    
    print("Enter the roll number of the student whose details you want to delete")
    
    del_roll: while true
    {
        roll_str = readLine()
        
        if let temp_roll_str = roll_str
        {
            if let temp_roll_delete = Int(temp_roll_str)
            {
                roll_to_delete = temp_roll_delete
                break del_roll
            }
            else
            {
                print("Enter a proper integer value")
            }
        }
        else
        {
            print("Blanks will not be appreciated")
        }
    }
    return roll_to_delete
}
