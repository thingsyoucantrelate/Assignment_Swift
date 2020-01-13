//
//  main.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 10/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

let choice_options = [1,2,3,4]
var student_records: [Int : Student] = [Int : Student]()
let menu_display = """

1.Add user details
2.Display user details
3.Delete user details
4.Exit

"""


main_loop: while true
{
    var choice:Int = 0
    print(menu_display)
    
    choice_loop: while true
    {
        
        let str_choice = readLine(strippingNewline: true)
        
        if let str_exists = str_choice
        {
            if let choice_exists = Int(str_exists)
            {
                choice = choice_exists
                if !choice_options.contains(choice)
                {
                    print("Enter a valid option")
                }
                else
                {
                    break choice_loop
                }
            }
            else
            {
                print("Enter a proper integer value for choice")
            }
            
        }
        else
        {
            print("Enter a value for choice")
        }
    }
    
    switch choice
    {
    case 1:
       let new_student = readStudentDetails()
       if !student_records.keys.contains(new_student.roll_no)
        {
            student_records[new_student.roll_no] = new_student
        }
        else
       {
        print("A student exists with the given roll number")
        }
    case 2:
        let sortChoice = readDisplayDetails()
        if !student_records.isEmpty
        {
            var student_logs = [Student](student_records.values)
            sortChoice(&student_logs)
            displayStudents(student_logs)
        }
        else
        {
            print("There are no records to display")
        }
        
    case 3:
        let roll_to_delete:Int = readDeletionDetails()
        if student_records.keys.contains(roll_to_delete)
        {
            student_records[roll_to_delete] = nil
        }
        else
        {
            print("The requested record does not exist and hence cannot be deleted")
        }
    case 4:
        print("Exiting...")
        break main_loop
    default:
        print("You're not supposed to be here")
    }
    
}
