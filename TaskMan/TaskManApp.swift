//
//  TaskManApp.swift
//  TaskMan
//
//  Created by Shaun Mitchell on 05/11/2022.
//

import SwiftUI

@main
struct TaskManApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(createHandler: CreateHandler(context: persistenceController.container.viewContext))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
