//
//  AlbumView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 5/5/2023.
//

import SwiftUI

struct AlbumView: View {
    let album: AlbumElement
    
    var body: some View {
        VStack(spacing: 30) {
            Text(album.name)
            VStack(spacing: 0) {
                ForEach(album.tracks!, id: \.self) { track in
                    SongListElementView(index: 1, name: track.name, duration: track.duration)
                }
            }
        }
        .frame(minWidth: 500, minHeight: 50)
        .padding(.horizontal, 20)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        let tracks = [Track(name: "lorem", artists: ["ipsum"], duration: 30), Track(name: "foo", artists: ["bar"], duration: 82), Track(name: "sandstorm", artists: ["darude"], duration: 148)]
        let album = AlbumElement(name: "Bip Bop", tracks: tracks)
        AlbumView(album: album)
    }
}
