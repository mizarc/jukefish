//
//  ArtistView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 17/4/2023.
//

import SwiftUI

struct ArtistThumbnailView: View {
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

struct ArtistThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistThumbnailView(name: "Placeholder")
    }
}
