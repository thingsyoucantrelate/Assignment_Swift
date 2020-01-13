//
//  ReadStudentDetails.swift
//  NucleiAssignment2
//
//  Created by Prateek K H on 13/01/20.
//  Copyright © 2020 Prateek K H. All rights reserved.
//

import Foundation

func readStudentDetails() -> Student
{
    let available_courses = ["A","B","C","D","E","F"]
    var course_details = [0,0,0,0,0,0]
    
    var name_string: String?
    var age_string: String?
    var roll_no_string: String?
    var address_string: String?
    var courses_string: String?
    
    var roll_no = 0
    var name = ""
    var address = ""
    var age = 0
    var courses = [String]()
    
    
    roll_no_entry: while true
    {
        print("Enter the Roll Number of the student")
        roll_no_string = readLine(strippingNewline: true)
        
        if let temp_roll_string = roll_no_string
        {
            if let roll_no_temp = Int(temp_roll_string)
            {
                roll_no = roll_no_temp
                
                if(roll_no < 0)
                {
                    print("Enter a valid roll number")
                }
                else
                {
                    break roll_no_entry
                }
            }
            else
            {
                print("Enter a valid integer for roll number")
            }
        }
        else
        {
            print("Blank fields are not appreciated")
        }
        
    }
    
    name_entry: while true
    {
        print("Enter the name of the student")
        name_string = readLine(strippingNewline: true)
        
        if let temp_name = name_string
        {
            name = temp_name
            break name_entry
        }
        else
        {
            print("Blank fields are not appreciated")
        }
    }
    
    age_entry: while true
    {
        print("Enter the age of the student")
        age_string = readLine(strippingNewline: true)
        
        if let age_temp = age_string
        {
            if let temp_int_age = Int(age_temp)
            {
                age = temp_int_age
                
                if age < 0
                {
                    print("You can't go backwards in time")
                }
                else
                {
                    break age_entry
                }
            }
            else
            {
                print("Enter a valid integer for age")
            }
        }
        else
        {
            print("Blank fields are not appreciated")
        }
    }
    
    address_entry: while true
    {
        print("Enter the address of the student")
        
        address_string = readLine(strippingNewline: true)
        
        if let temp_address = address_string
        {
            address = temp_address
            break address_entry
        }
        else
        {
            print("Blank fields are not appreciated")
        }
    }
    
    courses_entry: while true
    {
        print("Enter the courses chosen by the student")
        course_details = [0,0,0,0,0,0]
        
        courses_string = readLine(strippingNewline: true)
        
        if let temp_course = courses_string
        {
            courses = temp_course.components(separatedBy: " ")
            if courses.count < 4
            {
                print("Enter atleast four courses")
            }
            else if courses.count > 6
            {
                print("There can be max 6 courses")
            }
            else
            {
                var value_validator = true
                course_check: for course in courses
                {
                    if !available_courses.contains(course)
                    {
                        print("Invalid course entered")
                        value_validator = false
                        break course_check
                    }
                    else
                    {
                        switch course
                        {
                        case "A":
                            course_details[0] = course_details[0] + 1
                            if course_details[0] > 1
                            {
                                print("You can enroll in a course only once")
                                value_validator = false
                                break course_check
                                
                            }
                        case "B":
                            course_details[1] = course_details[1] + 1
                            if course_details[1] > 1
                            {
                                print("You can enroll in a course only once")
                                value_validator = false
                                break course_check
                                
                            }
                        case "C":
                            course_details[2] = course_details[2] + 1
                            if course_details[2] > 1
                            {
                                print("You can enroll in a course only once")
                                value_validator = false
                                break course_check
                            }
                        case "D":
                            course_details[3] = course_details[3] + 1
                            if course_details[3] > 1
                            {
                                print("You can enroll in a course only once")
                                value_validator = false
                                break course_check
                            }
                        case "E":
                            course_details[4] = course_details[4] + 1
                            if course_details[4] > 1
                            {
                                print("You can enroll in a course only once")
                                value_validator = false
                                break course_check
                            }
                        case "F":
                            course_details[5] = course_details[5] + 1
                            if course_details[5] > 1
                            {
                                print("You can enroll in a course only once")
                                value_validator = false
                                break course_check
                            }
                        default:
                            print("Houston, we have a problem")
                        }
                    }
                }
                if value_validator
                {
                    break courses_entry
                }
            }
        }
        
    }
    
    let new_student: Student = Student(full_name: name, age: age, address: address, roll_no: roll_no, courses: courses)
    
    return new_student
}
