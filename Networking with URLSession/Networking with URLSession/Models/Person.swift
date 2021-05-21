//
//  Person.swift
//  Networking with URLSession
//
//  Created by Jason Pinlac on 5/20/21.
//

import Foundation


struct Person {
  let firstName: String // json is first_name
  let lastName: String // json is last_name
  let age: Int
}

extension Person: Codable {
  enum CodingKeys: String, CodingKey {
    case firstName = "first_name"
    case lastName = "last_name"
    case age
  }
}
