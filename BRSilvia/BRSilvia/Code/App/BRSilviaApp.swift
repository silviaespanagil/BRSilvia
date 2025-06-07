//
//  BRSilviaApp.swift
//  BRSilvia
//
//  Created by Silvia España Gil on 7/6/25.
//

import SwiftUI

@main
struct BRSilviaApp: App {
    @StateObject private var persistenceService = PersistenceService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(persistenceService)
        }
    }
}
