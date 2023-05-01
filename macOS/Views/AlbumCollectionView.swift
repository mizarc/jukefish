//
//  AlbumView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 14/4/2023.
//

import SwiftUI

struct AlbumCollectionView: View {
    @EnvironmentObject var jellyfinInstance: JellyfinInstance
    @StateObject var albums = AlbumArtistCollectionViewModel()
    
    var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ForEach(albums.albums, id: \.self) { artist in
                    AlbumThumbnailView(name: album.name)
                }
            }
        }
        .navigationTitle("Albums")
    }
}

struct AlbumCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCollectionView()
    }
}
