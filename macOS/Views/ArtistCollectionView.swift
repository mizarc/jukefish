//
//  ArtistCollectionView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 17/4/2023.
//

import SwiftUI

struct ArtistCollectionView: View {
    @EnvironmentObject var jellyfinInstance: JellyfinInstance
    @StateObject var artists = ArtistCollectionViewModel()
    
    var items: [GridItem] = Array(repeating: .init(.adaptive(minimum: 200)), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: items) {
                ForEach(artists.artists, id: \.self) { artist in
                    ArtistThumbnailView(name: artist.name)
                }
            }
        }
        .navigationTitle("Artists")
        .onAppear() {
            Task {
                await artists.getArtists(jellyfinInstance: jellyfinInstance)
            }
        }
    }
}

struct ArtistCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistCollectionView()
    }
}
