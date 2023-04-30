//
//  AlbumArtistCollectionViewModel.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 1/5/2023.
//

import Foundation
import JellyfinAPI

struct AlbumArtistPreview: Hashable {
    let name: String
}

@MainActor class AlbumArtistCollectionViewModel: ObservableObject {
    //private var jellyfinInstance: JellyfinInstance? = nil
    @Published var artists: [AlbumArtistPreview] = [AlbumArtistPreview(name: "Placeholder")]
    
    /*
    init(jellyfinInstance: JellyfinInstance) {
        self.jellyfinInstance = jellyfinInstance
        
        Task {
            do {
                artists = await getArtists()!
            }
        }
    }
    */
    func getAlbumArtists(jellyfinInstance: JellyfinInstance) async {
        do {
            let query = try await jellyfinInstance.jellyfinClient!.send(Paths.getAlbumArtists())
            var artist_previews: [AlbumArtistPreview] = []
            for item in query.value.items! {
                //let image_query = try await jellyfinInstance.jellyfinClient!.send(Paths.getArtistImage(name: item.name!, imageType: "Primary", imageIndex: 0))
                artist_previews.append(AlbumArtistPreview(name: item.name!))
                //print(artist_previews[0].name)
            }
            self.artists = artist_previews
        }
        catch {
            self.artists = []
        }
    }
}
