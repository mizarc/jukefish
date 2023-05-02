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
    let thumbnail: [String: String]
}

@MainActor class AlbumCollectionViewModel: ObservableObject {
    //private var jellyfinInstance: JellyfinInstance? = nil
    @Published var albums: [AlbumPreview] = [AlbumPreview(album_name: "Placeholder", artist_name: "Wack", thumbnail: ["a": "b"])]
    
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
            let query = try await jellyfinInstance.jellyfinClient!.send(Paths.getItems(parameters: parameters))
            var album_previews: [AlbumPreview] = []
            for item in query.value.items! {
                print(item)
                //let image_query = try await jellyfinInstance.jellyfinClient!.send(Paths.getArtistImage(name: item.name!, imageType: "Primary", imageIndex: 0))
                album_previews.append(AlbumPreview(album_name: item.name!, artist_name: item.albumArtist ?? "Unknown Artist", thumbnail: item.imageBlurHashes?.primary ?? ["e7cd30fa5faf8b60767d2ed3cdd7d65e": "VKKcbO?bxY%L=}~AM_i^V]xI,@RkrrNbkD^*kYs,o}kX"]))
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
