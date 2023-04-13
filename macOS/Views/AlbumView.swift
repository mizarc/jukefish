//
//  AlbumView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 14/4/2023.
//

import SwiftUI

struct AlbumView: View {
    var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                Text("Placeholder1")
                Text("Placeholder2")
                Text("Placeholder3")
                Text("Placeholder4")
                Text("Placeholder5")
                Text("Placeholder6")
            }
        }
        .navigationTitle("Albums")
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
