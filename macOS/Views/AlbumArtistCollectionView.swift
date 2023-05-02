//
//  AlbumArtistCollectionView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 1/5/2023.
//

import SwiftUI

struct AlbumArtistCollectionView: View {
    @EnvironmentObject var jellyfinInstance: JellyfinInstance
    @StateObject var artists = AlbumArtistCollectionViewModel()
    
    var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ForEach(artists.artists, id: \.self) { artist in
                    AlbumArtistThumbnailView(name: artist.name)
                }
            }
        }
        .navigationTitle("Artists")
        .onAppear() {
            Task {
                await artists.getAlbumArtists(jellyfinInstance: jellyfinInstance)
            }
        }
    }
}

struct AlbumArtistCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumArtistCollectionView()
    }
}
