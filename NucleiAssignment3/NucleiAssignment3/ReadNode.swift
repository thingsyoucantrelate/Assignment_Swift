//
//  readNodeID.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation


func readNode() -> String
{
    var nodeName:String = ""
    
    name_entry: while true
    {
        let name_str = readLine(strippingNewline: true)
        
        if let str_exists = name_str
        {
            nodeName = str_exists
            break name_entry
        }
        else
        {
            print("Blanks will not be appreciated")
        }
    }
    return nodeName
}
