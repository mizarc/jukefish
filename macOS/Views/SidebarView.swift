//
//  SidebarView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 28/3/2022.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Libraries")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                NavigationLink(destination: MusicView()) {
                    Label("Music", systemImage: "book")
                }
                
                Text("Jellyfin Libraries")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.gray)
                    .padding(.top, 14)
                NavigationLink(destination: MusicView()) {
                    Label("All Libraries", systemImage: "book")
                }
                NavigationLink(destination: MusicView()) {
                    Label("Music", systemImage: "book")
                }
                NavigationLink(destination: AlbumView()) {
                    Label("Albums", systemImage: "book")
                }
                NavigationLink(destination: MusicView()) {
                    Label("Movies", systemImage: "book")
                }
            }
            .navigationTitle("Woopie")
            .toolbar {
                ToolbarItem {
                    Menu {

                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Landmark")
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
