//
//  ReadNewNode.swift
//  NucleiAssignment3
//
//  Created by Prateek K H on 16/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func readNewNode() -> Node
{
    var newNode: Node? = nil
    node_loop: while true
    {
        let nodeName = readLine(strippingNewline: true)
        if let str_exists = nodeName
        {
            newNode = Node(str_exists, generateNewID())
            break node_loop
        }
        else
        {
            print("Enter a valid name")
        }
    }
    return newNode!
}
