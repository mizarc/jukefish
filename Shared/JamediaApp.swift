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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func createJellyfinInstance() async -> JellyfinClient? {
    let test_configuration = JellyfinClient.Configuration(url: URL(string: "testurl")!, client: "JukeFish", deviceName: "TestDev", deviceID: "1", version: "0.1")
    let jellyfinClient = JellyfinClient(configuration: test_configuration)
     
    do {
        print("got this far 1")
        let response = try await jellyfinClient.signIn(username: "us", password: "pw")
        print("got this far 2")
        return jellyfinClient
    }
    catch {
        return nil
    }
}

func displayArtists(jellyfinClient: JellyfinClient) async -> Response<URL>? {
    do {
        let query = try await jellyfinClient.download(for: Paths.getArtists())
        return query
    }
    catch {
        return nil
    }
}
