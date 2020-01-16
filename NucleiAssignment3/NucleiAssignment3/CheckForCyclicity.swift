//
//  CheckForCyclicity.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func checkForCyclicity(_ parentNodeID: Int, _ childNodeID: Int) -> Bool
{
    if let parentNode = lookUp(parentNodeID)
    {
        if parentNode.parentSet.contains(childNodeID)
        {
            return true
        }
        else
        {
            var result:Bool = false
            for nodeID in parentNode.parentSet
            {
                result = (result || checkForCyclicity(nodeID, childNodeID))
                if result
                {
                    return result
                }
            }
        }
    }
    return false
}
