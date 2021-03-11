//
//  NetworkingManagerProtocol.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation
import Combine

protocol NetworkingManagerProtocol {
    func subscribeToPostings() -> URLSession.DataTaskPublisher
    func subscribeToComments(postId: Int) -> URLSession.DataTaskPublisher
}
