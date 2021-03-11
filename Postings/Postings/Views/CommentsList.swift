//
//  CommentsList.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import SwiftUI

struct CommentsList: View {
    @ObservedObject var commentViewModel: CommentViewModel
    
    
    init(viewModel: CommentViewModel) {
        self.commentViewModel = viewModel
        self.commentViewModel.getComments()
    }

    var body: some View {
        
        List(self.commentViewModel.comments) { comment in
            CommentRow(comment: comment)
        }
        .navigationTitle(Strings.Navigation.Comments.title)
    
    }
}


struct CommentsList_Previews: PreviewProvider {
    static var previews: some View {
        CommentsList(viewModel: CommentViewModel(postId:1, networkingManager: NetworkingManager()))
    }
}
