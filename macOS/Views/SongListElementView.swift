//
//  AlbumView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 5/5/2023.
//

import SwiftUI

struct SongListElementView: View {
    let index: Int
    let name: String
    let duration: Int
    
    var body: some View {
        HStack(spacing: 30) {
            Text(String(index))
            Text(name)
            Spacer()
            Text(String(formatDuration(duration)))
        }
        .frame(minWidth: 500, minHeight: 50)
        .padding(.horizontal, 20)
    }
    
    func formatDuration(_ duration: Int) -> String {
        let minutes = duration / 60
        let seconds = duration % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct SongListElementView_Previews: PreviewProvider {
    static var previews: some View {
        SongListElementView(index: 1, name: "Sandstorm", duration: 225)
    }
}
