//
//  NewsApp.swift
//  News
//
//  Created by Adriano Rezena on 05/01/23.
//

import SwiftUI

@main
struct NewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
