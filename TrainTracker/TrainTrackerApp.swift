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
    //this is to handle EnvironmentObject
    @StateObject private var station = SelectedStation()
    var body: some Scene {
        
        WindowGroup {
            ContentView()
            //handles environment object
                .environmentObject(station)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }
    }
}
