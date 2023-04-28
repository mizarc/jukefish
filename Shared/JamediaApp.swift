//
//  JamediaApp.swift
//  Shared
//
//  Created by Mizarc on 28/3/2022.
//

import SwiftUI
import JellyfinAPI
import Get

@main
struct JamediaApp: App {
    var jellyfinInstance = JellyfinInstance()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(jellyfinInstance)
        }
    }
}

class JellyfinInstance: ObservableObject {
    @Published var jellyfinClient: JellyfinClient?
    
    init() {
        Task {
            self.jellyfinClient = await createJellyfinInstance()
        }
    }
}

func createJellyfinInstance() async -> JellyfinClient? {
    let test_configuration = JellyfinClient.Configuration(url: URL(string: "testurl")!, client: "JukeFish", deviceName: "TestDev", deviceID: "1", version: "0.1")
    let jellyfinClient = JellyfinClient(configuration: test_configuration)
     
    do {
        print("got this far 1")
        try await jellyfinClient.signIn(username: "us", password: "pw")
        print("got this far 2")
        return jellyfinClient
    }
    catch {
        return nil
    }
}
