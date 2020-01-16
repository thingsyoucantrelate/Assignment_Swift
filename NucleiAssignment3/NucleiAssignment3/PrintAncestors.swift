//
//  PrintAncestors.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation


func printAncestors(_ nodeID: Int)
{
    var resultSet: Set<Int> = []
    printAncestorsUtil(nodeID,&resultSet)
    
    for resultNodeID in resultSet
    {
        if let resultNode = lookUp(resultNodeID)
        {
            print("Node name:\(resultNode.name)\tNode ID:\(resultNode.nodeID)")
        }
    }
}


func printAncestorsUtil(_ nodeID: Int,_ resultSet: inout Set<Int>)
{
    if let nodeExists = lookUp(nodeID)
    {
        resultSet.insert(nodeID)
        for parentNodeID in nodeExists.parentSet
        {
            printAncestorsUtil(parentNodeID, &resultSet)
        }
    }
}
