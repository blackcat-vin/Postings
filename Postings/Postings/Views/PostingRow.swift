//
//  PostingRow.swift
//  Postings
//
//  Created by Vineet Kashyap on 09/03/21.
//

import SwiftUI

struct PostingRow: View {
    let posting: Posting
    init(posting: Posting) {
        self.posting = posting
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text(posting.id.description).bold()
            Text(posting.title)
        }
    }
}

struct PostingRow_Previews: PreviewProvider {
    static var previews: some View {
        PostingRow(posting: Posting.init(userId: 1, id: 1, title: "Lorem ipsum", body: "The quick brown fox jumps over the lazy dog"))
    }
}

