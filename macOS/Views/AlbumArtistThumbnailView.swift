//
//  AlbumArtistView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 1/5/2023.
//

import SwiftUI

struct AlbumArtistThumbnailView: View {
    let name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: /*@START_MENU_TOKEN@*/URL(string: "https://example.com/icon.png")/*@END_MENU_TOKEN@*/)
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text(name).bold()
        }
    }
}

struct AlbumArtistThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumArtistThumbnailView(name: "Placeholder")
    }
}
