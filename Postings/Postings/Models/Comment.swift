//
//  Comment.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation

struct Comment : Codable, Identifiable {
    let postId : Int
    let id : Int
    let name : String
    let email : String
    let body : String

    enum CodingKeys: String, CodingKey {

        case postId = "postId"
        case id = "id"
        case name = "name"
        case email = "email"
        case body = "body"
    }
}
