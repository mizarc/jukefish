//
//  ServerSelectView.swift
//  Jamedia (macOS)
//
//  Created by Mizarc on 12/4/2023.
//

import SwiftUI

struct ServerSelectView: View {
    @State var hostname: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            HostnameHeader()
            
            VStack(alignment: .trailing) {
                HostnameField(hostname: $hostname)
            }
            .frame(maxWidth: 300)
            
            Spacer()
            
            HStack {
                Spacer()
                ConnectButton()
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .disabled(hostname.isEmpty)
            }
        }
        .frame(width: 400, height: 200)
    }
}

struct HostnameHeader: View {
    var body: some View {
        Text("Locate Your Jellyfin Server")
            .bold()
    }
}

struct HostnameField: View {
    @Binding var hostname: String
    
    var body: some View {
        HStack {
            Text("Hostname:")
            TextField("jellyfin.example.com", text: $hostname)
                .frame(maxWidth: 200)
        }
        
    }
}

struct ConnectButton: View {
    var body: some View {
        Button("Connect") {
            
        }
        .keyboardShortcut(.defaultAction)
    }
}

struct ServerSelect_Previews: PreviewProvider {
    static var previews: some View {
        ServerSelectView()
    }
}
