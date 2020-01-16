//
//  ReadNodeID.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func readNodeID() -> Int
{
    var nodeID:Int = 0
    
    nodeId_entry: while true
    {
        let nodeId_str = readLine(strippingNewline: true)
        
        if let str_exists = nodeId_str
        {
            if let int_exists = Int(str_exists)
            {
                nodeID = int_exists
                break nodeId_entry
            }
            else
            {
                print("Enter a valid integer")
            }
        }
        else
        {
            print("Blanks will not be appreciated")
        }
    }
    return nodeID
}
