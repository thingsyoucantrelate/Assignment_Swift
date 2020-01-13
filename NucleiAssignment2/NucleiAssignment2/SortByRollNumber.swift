//
//  SortByRollNumber.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func sortByRollNoAsc( _ student_records: inout [Student])
{
    student_records.sort(by: {(_ student1: Student, _ student2: Student) -> Bool in
        if student1.roll_no < student2.roll_no
        {
            return true
        }
        else {
            return false
        }
        })
}

func sortByRollNoDesc( _ student_records: inout [Student])
{
    student_records.sort(by: {(_ student1: Student, _ student2: Student) -> Bool in
        if student1.roll_no < student2.roll_no
        {
            return false
        }
        else {
            return true
        }
        })
}
