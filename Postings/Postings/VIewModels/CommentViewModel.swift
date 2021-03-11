//
//  CommentViewModel.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation
import Combine

public class CommentViewModel: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var comments = [Comment]()
    
    var postId: Int = 0
    private let networkingManager: NetworkingManagerProtocol

    var disposables = Set<AnyCancellable>()

   
    init(postId: Int, networkingManager: NetworkingManagerProtocol) {
        self.postId = postId
        self.networkingManager = networkingManager
    }
    
    func getComments() {
        isLoading = true

        
        networkingManager.subscribeToComments(postId: self.postId).tryMap() { element -> Data in
            guard let httpResponse = element.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            return element.data
        }
        .decode(type: [Comment].self, decoder: JSONDecoder())
        .mapError { error in
            return error
        }
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { debugPrint ("Received completion: \($0).") },
              receiveValue: { comments in
                debugPrint ("Response data: \(comments.debugDescription).")
                self.comments = comments
                
              })
        .store(in: &disposables)
    }
}

