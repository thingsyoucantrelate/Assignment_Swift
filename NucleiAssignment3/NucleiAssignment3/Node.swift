//
//  Node.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation


class Node
{
    var name:String = ""
    var nodeID:Int = -1
    
    var parentSet:Set<Int> = []
    var childrenSet:Set<Int> = []
    
    init(_ name: String,_ nodeID: Int)
    {
        self.name = name
        self.nodeID = nodeID
    }
    
    
    func addParent(_ nodeID: Int)
    {
        parentSet.insert(nodeID)
    }
    
    func removeParent(_ nodeID: Int)
    {
        parentSet.remove(nodeID)
    }
    
    func addChild(_ nodeID: Int)
    {
        childrenSet.insert(nodeID)
    }
    
    func removeChild(_ nodeID: Int)
    {
        childrenSet.remove(nodeID)
    }
    
    func printParents(_ nodeDict: Dictionary<Int,Node>)
    {
        for nodeID in parentSet
        {
            
            if let nodeName = nodeDict[nodeID]
            {
                print("Node ID: \(nodeID)",terminator:"\t")
                print("Node Name: \(nodeName.name)")
            }
            else
            {
                print("A connection was severd but there are still problems")
            }
        }
    }
    
    func printChildren(_ nodeDict: Dictionary<Int, Node>)
    {
        for nodeID in childrenSet
        {
            if let nodeName = nodeDict[nodeID]
            {
                print("Node ID: \(nodeID)",terminator: "\t")
                print("Node Name: \(nodeName.name)")
            }
            else
            {
                print("A half-ass severed connection")
            }
        }
    }
}
