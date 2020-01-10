//
//  item.swift
//  NucleiAssignment1
//
//  Created by Prateek K H on 10/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

protocol Item
{
    var name:String {get set}
    var price:Double {get set}
    var quantity:Int {get set}
    var type:String {get}
    var final_price:Double!{get set}
    
    func calc_tax() -> Double
}
