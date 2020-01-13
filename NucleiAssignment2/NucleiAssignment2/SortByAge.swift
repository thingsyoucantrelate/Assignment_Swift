//
//  SortByAge.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func sortByAgeAsc(_ student_records: inout [Student])
{
    student_records.sort(by: {(_ student1: Student,_ student2: Student) -> Bool in
        if student1.age < student2.age
        {
            return true
        }
        else if student1.age == student2.age
        {
            return student1.roll_no < student2.roll_no
        }
        else
        {
            return false
        }
    }
    )
}

func sortByAgeDesc(_ student_records: inout [Student])
{
    student_records.sort(by:{(_ student1: Student,_ student2: Student) -> Bool in
        if student1.age < student2.age
        {
            return false
        }
        else if student1.age == student2.age
        {
            return student1.roll_no < student2.roll_no
        }
        else
        {
            return true
        }
    }
    )
}
