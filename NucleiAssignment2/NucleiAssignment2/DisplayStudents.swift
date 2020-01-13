//
//  DisplayStudents.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation


func displayStudents(_ student_logs: [Student])
{
    print("/*********** Student Details **************/")
    print("Roll no", terminator: "\t\t")
    print("Name", terminator: "\t\t")
    print("Age", terminator: "\t\t")
    print("Address", terminator: "\t\t")
    print("Courses")
    
    for student in student_logs
    {
        print(student.roll_no, terminator: "\t\t")
        print(student.full_name, terminator: "\t\t")
        print(student.age, terminator: "\t\t")
        print(student.address, terminator: "\t\t")
        print(student.courses)
    }
}
