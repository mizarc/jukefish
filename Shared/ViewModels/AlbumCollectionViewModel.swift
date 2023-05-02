//
//  AlbumCollectionViewModel.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 2/5/2023.
//

import Foundation
import JellyfinAPI

struct AlbumPreview: Hashable {
    let album_name: String
    let artist_name: String
}

@MainActor class AlbumCollectionViewModel: ObservableObject {
    //private var jellyfinInstance: JellyfinInstance? = nil
    @Published var albums: [AlbumPreview] = [AlbumPreview(album_name: "Placeholder", artist_name: "Wack")]
    
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
    func getAlbums(jellyfinInstance: JellyfinInstance) async {
        do {
            let parameters = Paths.GetItemsParameters(isRecursive: true, includeItemTypes: [BaseItemKind.musicAlbum], sortBy: ["Ascending"])
            print("start")
            let query = try await jellyfinInstance.jellyfinClient!.send(Paths.getItems(parameters: parameters))
            print(query)
            print("done")
            var album_previews: [AlbumPreview] = []
            for item in query.value.items! {
                //let image_query = try await jellyfinInstance.jellyfinClient!.send(Paths.getArtistImage(name: item.name!, imageType: "Primary", imageIndex: 0))
                album_previews.append(AlbumPreview(album_name: item.name!, artist_name: item.albumArtist ?? "Unknown Artist"))
                //print(artist_previews[0].name)
            }
            self.albums = album_previews
        }
        catch {
            print("wack really")
            self.albums = []
        }
    }
}
