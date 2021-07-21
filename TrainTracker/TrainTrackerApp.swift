//
//  TrainTrackerApp.swift
//  TrainTracker
//
//  Created by Nicholas Repaci on 7/20/21.
//

import SwiftUI

@main
struct TrainTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
