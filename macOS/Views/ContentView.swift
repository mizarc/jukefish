//
//  ContentView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 29/3/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SidebarView()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
