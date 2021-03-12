//
//  CommentRow.swift
//  Postings
//
//  Created by Vineet Kashyap on 11/03/21.
//

import SwiftUI

struct CommentRow: View {
    let comment: Comment
    init(comment: Comment) {
        self.comment = comment
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(comment.email).bold()
            Spacer()
            Text(comment.name)
        }
    }
}

struct CommentRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentRow(comment: Comment.init(postId: 1, id: 1, name: "Vineet", email: "kashyap.vineet@gmail.com", body: "The quick brown fox jumps over the lazy dog"))
    }
}


