//
//  AlbumViewModel.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 5/5/2023.
//

import Foundation
import JellyfinAPI

struct Track: Hashable {
    let name: String
    let artists: [String]
    let duration: Int
}

struct AlbumElement {
    let name: String
    let tracks: [Track]?
}

@MainActor class AlbumViewModel: ObservableObject {
    //private var jellyfinInstance: JellyfinInstance? = nil
    @Published var album: AlbumElement = AlbumElement(name: "Placeholder", tracks: nil)
    
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
    func getAlbum(jellyfinInstance: JellyfinInstance) async {
        do {
            let parameters = Paths.GetItemsParameters(isRecursive: true, includeItemTypes: [BaseItemKind.audio], sortBy: ["Ascending"])
            let query = try await jellyfinInstance.jellyfinClient!.send(Paths.getItems(parameters: parameters))
            var tracks: [Track] = []
            for item in query.value.items! {
                print(item)
                //let image_query = try await jellyfinInstance.jellyfinClient!.send(Paths.getArtistImage(name: item.name!, imageType: "Primary", imageIndex: 0))
                tracks.append(Track(name: item.name!, artists: item.artists!, duration: 1))
                //print(artist_previews[0].name)
            }
            album = AlbumElement(name: "test", tracks: tracks)
            self.album = album
        }
        catch {
            self.album = AlbumElement(name: "Placeholder", tracks: nil)
        }
    }
}
