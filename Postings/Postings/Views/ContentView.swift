//
//  ContentView.swift
//  Postings
//
//  Created by Vineet Kashyap on 11/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PostingsList(viewModel: PostingViewModel(networkingManager: NetworkingManager()))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
