//
//  DebugView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 19/4/2023.
//

import SwiftUI

struct DebugView: View {
    @State private var test_result = "asdf"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(test_result)
        }
        .onAppear() {
            Task {
                do {
                    let a = await createJellyfinInstance()
                    let result = try await displayArtists(jellyfinClient: a!)
                    test_result = (result?.value.absoluteString)!
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
