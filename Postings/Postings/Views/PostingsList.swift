//
//  PostingsList.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import Foundation
import SwiftUI

struct PostingsList: View {
    @ObservedObject var postingViewModel: PostingViewModel
    
    
    init(viewModel: PostingViewModel) {
        self.postingViewModel = viewModel
        self.postingViewModel.getPosts()
    }

    var body: some View {
        NavigationView {
            List(self.postingViewModel.postings) { posting in
                NavigationLink(
                    destination: CommentsList(viewModel: CommentViewModel(postId: posting.id, networkingManager: self.postingViewModel.networkingManager)),
                    label: {
                        PostingRow(posting: posting)
                    })
                    
            }
            .navigationTitle(Strings.Navigation.Postings.title)
        }
    
    }
}

struct PostingsList_Previews: PreviewProvider {
    static var previews: some View {
        PostingsList(viewModel: PostingViewModel(networkingManager: NetworkingManager()))
    }
}
