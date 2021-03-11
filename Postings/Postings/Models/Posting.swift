//
//  Posting.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation

struct Posting : Codable, Identifiable {
    let userId : Int
    let id : Int
    let title : String
    let body : String

    enum CodingKeys: String, CodingKey {

        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
