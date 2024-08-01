//
//  Employee.swift
//  JLLExample
//
//  Created by Mike Jasso on 29/07/24.
//

import Foundation

class APIEmployeeResponse: Codable {
    var status: String
    var data: [Employee]
    
    enum CodingKeys: CodingKey {
        case status
        case data
    }
}

class Employee: Codable {
    var employeeName, profileImage : String
    var id, employeeAge, employeeSalary: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
    
}

