//
//  NetworkingManager.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation
import Combine

public class NetworkingManager: NetworkingManagerProtocol {
    let baseServiceUrl = Strings.Service.url
        
    func subscribeToPostings() -> URLSession.DataTaskPublisher {
        guard let url = URL(string: baseServiceUrl) else { fatalError() }

        debugPrint ("Request url: \(url).")
        return URLSession.shared.dataTaskPublisher(for: URLRequest.init(url: url))
    }
    
    func subscribeToComments(postId: Int) -> URLSession.DataTaskPublisher {
        let serviceUrl = URL(string: baseServiceUrl + postId.description + "/comments")
        guard let url = serviceUrl  else { fatalError() }

        debugPrint ("Request url: \(url)")
        return URLSession.shared.dataTaskPublisher(for: URLRequest.init(url: url))
    }
}
