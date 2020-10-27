//
//  Person.swift
//  1 Networking In Swift With URLSession
//
//  Created by Jason Pinlac on 10/27/20.
//

import Foundation

struct Person: Codable {
    let age: Int
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case age
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
