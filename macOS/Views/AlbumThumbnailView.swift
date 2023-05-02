//
//  AlbumView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 14/4/2023.
//

import SwiftUI

struct AlbumThumbnailView: View {
    let album_name: String
    let artist_name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: /*@START_MENU_TOKEN@*/URL(string: "https://example.com/icon.png")/*@END_MENU_TOKEN@*/)
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text(album_name).bold()
            Text(artist_name)
        }
    }
}

struct AlbumThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumThumbnailView(album_name: "Artist Placeholder", artist_name: "Album Placeholder")
    }
}
