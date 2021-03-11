//
//  PostingViewModel.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation
import Combine

public class PostingViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var postings = [Posting]()
    
    let networkingManager: NetworkingManagerProtocol
    var disposables = Set<AnyCancellable>()

   
    init(networkingManager: NetworkingManagerProtocol) {
        self.networkingManager = networkingManager
    }
    
    func getPosts() {
        isLoading = true
        
        networkingManager.subscribeToPostings().tryMap() { element -> Data in
            guard let httpResponse = element.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            return element.data
        }
        .decode(type: [Posting].self, decoder: JSONDecoder())
        .mapError { error in
            return error
        }
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { debugPrint ("Received completion: \($0).") },
              receiveValue: { postings in
                debugPrint ("Response data: \(postings.debugDescription).")
                self.postings = postings
                
              })
        .store(in: &disposables)
    }
}
