//
//  ArtistCollectionView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 17/4/2023.
//

import SwiftUI

struct ArtistCollectionView: View {
    var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ArtistView()
                ArtistView()
                ArtistView()
                ArtistView()
                ArtistView()
                ArtistView()
                ArtistView()
            }
        }
        .navigationTitle("Artists")
    }
}

struct ArtistCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCollectionView()
    }
}
