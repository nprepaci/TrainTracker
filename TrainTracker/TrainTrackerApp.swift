//
//  TrainTrackerApp.swift
//  TrainTracker
//
//  Created by Nicholas Repaci on 7/20/21.
//

import SwiftUI

@main
struct TrainTrackerApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = true
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}
