//
//  main.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

let choice_options = [1,2,3,4,5,6,7,8,9]
let display_options = """

1.Print immediate parents
2.Print immediate children
3.Print all ancestors
4.Print all descendants
5.Delete a dependency
6.Delete a Node
7.Add dependency
8.Add a Node
9.Exit

"""
var choice:Int = 0

var nodeIdGen:Int = 0
var nodeDict:[Int:Node] = [:]


func lookUp(_ nodeID: Int) -> Node?
{
    return nodeDict[nodeID]
}

func generateNewID() -> Int
{
    nodeIdGen = nodeIdGen + 1
    return nodeIdGen
}

//root insertion
let root = Node("root",0)
nodeDict[0] = root

main_loop: while true
{
    print("Choose an option")
    print(display_options)
    
    choice_entry: while true
    {
        let choice_str = readLine(strippingNewline: true)
        
        if let str_exists = choice_str
        {
            if let int_exists = Int(str_exists)
            {
                choice = int_exists
                if choice_options.contains(choice)
                {
                    break choice_entry
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
            print("Blanks will not be appreciated")
        }
    }
    
    
    switch choice
    {
    case 1:
        var nodeID:Int = -1
        nodeId_entry: while true
        {
            print("Enter Node ID")
            nodeID = readNodeID()
            if nodeDict.keys.contains(nodeID)
            {
                break nodeId_entry
            }
            else
            {
                print("Enter a node ID which exists")
            }
        }
        if let nodeToPrintParents = nodeDict[nodeID]
        {
            print("Printing parents of node:\(nodeID)")
            nodeToPrintParents.printParents(nodeDict)
        }
        else
        {
            print("Requested node not present in the graph")
        }
    case 2:
        var nodeID:Int = -1
        nodeId_entry: while true
        {
            print("Enter Node ID")
            nodeID = readNodeID()
            
            if nodeDict.keys.contains(nodeID)
            {
                break nodeId_entry
            }
            else
            {
                print("Enter a node ID which exists")
            }
        }
        
        if let nodeToPrintChildren = nodeDict[nodeID]
        {
            print("Printing children of node:\(nodeID)")
            nodeToPrintChildren.printChildren(nodeDict)
        }
        else
        {
            print("Requested node not present in the graph")
        }
        
    case 3:
        var nodeID:Int = -1
        
        print("Enter the node ID")
        nodeID = readNodeID()
        
        if nodeDict.keys.contains(nodeID)
        {
            printAncestors(nodeID)
        }
        else
        {
            print("Enter a valid node id")
        }
   
    case 4:
        var nodeID:Int = -1
        
        print("Enter the node ID")
        nodeID = readNodeID()
        
        if nodeDict.keys.contains(nodeID)
        {
            printDescendents(nodeID)
        }
        else
        {
            print("Enter a valid node id")
        }
        
    case 5:
        print("Enter parent node ID")
        let parentNodeID:Int = readNodeID()
        
        print("Enter child node ID")
        let childNodeID:Int = readNodeID()
        
        if nodeDict.keys.contains(parentNodeID) && nodeDict.keys.contains(childNodeID)
        {
            if let parentNode = nodeDict[parentNodeID]
            {
                parentNode.removeChild(childNodeID)
            }
            else
            {
                print("Error in case 5")
            }
            if let childNode = nodeDict[childNodeID]
            {
                childNode.removeParent(parentNodeID)
            }
            else
            {
                print("Error in case 5 act 2")
            }
        }
        
        
    case 6:
        var nodeID:Int = -1
        
        print("Enter the node ID")
        nodeID = readNodeID()
        
        if let nodeToDelete = nodeDict[nodeID]
        {
            for childNodeID in nodeToDelete.childrenSet
            {
                if let childNode = lookUp(childNodeID)
                {
                    childNode.removeParent(nodeToDelete.nodeID)
                }
                else
                {
                    print("Error in case 6 part 1")
                }
            }
            
            for parentNodeID in nodeToDelete.parentSet
            {
                if let parentNode = lookUp(parentNodeID)
                {
                    parentNode.removeChild(nodeToDelete.nodeID)
                }
                else
                {
                    print("Error in case 6 act 2")
                }
            }
            
            //delete the node
            nodeDict[nodeID] = nil
        }
        else
        {
            print("Enter a valid node ID")
        }
        
    case 7:
        print("Enter the parent node ID")
        let parentNodeID = readNodeID()
        
        print("Enter child node ID")
        let childNodeID = readNodeID()
        
        if nodeDict.keys.contains(parentNodeID) && nodeDict.keys.contains(childNodeID)
        {

            if !checkForCyclicity(parentNodeID, childNodeID)
            {
                if let parentNode = nodeDict[parentNodeID]
                {
                    parentNode.addChild(childNodeID)
                }
                else
                {
                    print("Error in case 7 part 1")
                }
                
                if let childNode = nodeDict[childNodeID]
                {
                    childNode.addParent(parentNodeID)
                }
                else
                {
                    print("Error in case 7 part 2")
                }
            }
            else
            {
                print("Cannot add dependency as it creates a cycle")
            }
        }
        else
        {
            print("Either/Both of the provided node IDs do not exist")
        }
        
    case 8:
        print("Enter the name of the node")
        let newNode = readNewNode()
        nodeDict[newNode.nodeID] = newNode
        print("Node successfully added with name:\(newNode.name) and id:\(newNode.nodeID)")
    case 9:
        print("Exiting.......")
        break main_loop
    default:
        print("Enter a correct option")
    }
    
}
