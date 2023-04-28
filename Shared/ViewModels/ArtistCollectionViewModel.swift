//
//  ArtistCollectionViewModel.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 23/4/2023.
//

import Foundation
import JellyfinAPI

struct ArtistPreview: Hashable {
    let name: String
}

@MainActor class ArtistCollectionViewModel: ObservableObject {
    //private var jellyfinInstance: JellyfinInstance? = nil
    @Published var artists: [ArtistPreview] = [ArtistPreview(name: "Placeholder")]
    
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
    func getArtists(jellyfinInstance: JellyfinInstance) async {
        do {
            let query = try await jellyfinInstance.jellyfinClient!.send(Paths.getArtists())
            var artist_previews: [ArtistPreview] = []
            for item in query.value.items! {
                artist_previews.append(ArtistPreview(name: item.name!))
            }
            
            self.artists = artist_previews
        }
        catch {
            self.artists = []
        }
    }
}
