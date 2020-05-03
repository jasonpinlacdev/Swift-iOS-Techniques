//
//  Post.swift
//  HTTP Request with URLSession
//
//  Created by Jason Pinlac on 5/3/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
