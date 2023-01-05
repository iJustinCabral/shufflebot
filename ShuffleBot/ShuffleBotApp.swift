//
//  ShuffleBotApp.swift
//  ShuffleBot
//
//  Created by Justin Cabral on 1/5/23.
//

import SwiftUI

@main
struct ShuffleBotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
