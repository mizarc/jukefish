//
//  DebugView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 19/4/2023.
//

import SwiftUI

struct DebugView: View {
    @EnvironmentObject var jellyfinInstance: JellyfinInstance
    @StateObject var artists = ArtistCollectionViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(artists.artists, id: \.self) { artist in
                Text(artist.name)
            }
        }
        .onAppear() {
            Task {
                await artists.getArtists(jellyfinInstance: jellyfinInstance)
            }
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
