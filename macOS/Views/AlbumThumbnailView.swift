//
//  AlbumView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 14/4/2023.
//

import SwiftUI
import AppKit

struct AlbumThumbnailView: View {
    let album_name: String
    let artist_name: String
    let thumbnail_hash: [String: String]
    
    var body: some View {
        let sample_image = NSImage(blurHash: "VKKcbO?bxY%L=}~AM_i^V]xI,@RkrrNbkD^*kYs,o}kX", size: CGSize(width: 32, height: 32))
        let blurred_image = NSImage(blurHash: Array(thumbnail_hash.values)[0], size: CGSize(width: 32, height: 32))
        VStack(alignment: .leading) {
            Image(nsImage: (blurred_image ?? sample_image)!)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
            Text(album_name).bold()
            Text(artist_name)
        }
    }
}

struct AlbumThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumThumbnailView(album_name: "Artist Placeholder", artist_name: "Album Placeholder", thumbnail_hash: ["e7cd30fa5faf8b60767d2ed3cdd7d65e": "VKKcbO?bxY%L=}~AM_i^V]xI,@RkrrNbkD^*kYs,o}kX"])
    }
}
