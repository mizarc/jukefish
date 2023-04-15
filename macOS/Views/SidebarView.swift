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
                    .padding(.top, 14)
                NavigationLink(destination: AlbumCollectionView()) {
                    Label("Albums", systemImage: "book")
                }
                NavigationLink(destination: MusicView()) {
                    Label("Artists", systemImage: "book")
                }
                NavigationLink(destination: MusicView()) {
                    Label("Songs", systemImage: "book")
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
