//
//  Student.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation


class Student
{
    let full_name: String
    let age: Int
    let address: String
    let roll_no: Int
    let courses: [String]
    
    init(full_name: String, age: Int, address: String, roll_no: Int, courses: [String])
    {
        self.full_name = full_name
        self.age = age
        self.address = address
        self.roll_no = roll_no
        self.courses = courses
    }
}

