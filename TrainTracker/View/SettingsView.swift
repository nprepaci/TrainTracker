//
//  SettingsView.swift
//  SettingsView
//
//  Created by Nicholas Repaci on 7/28/21.
//

import SwiftUI

struct SettingsView: View {
    
    // MARK: Properties
    @ObservedObject var userPreferences: UserPreferences
    @State var stationToPassToAPI = ""
    var stationArray = ["1", "2", "3", "4", "5", "6", "7", "A", "C", "E", "N", "Q", "R", "W", "B", "D", "F", "M", "L", "G", "J", "Z"]
    
    // MARK: View
    var body: some View {
        ZStack {
            Color(red: userPreferences.backgroundRed / 255,
                  green: userPreferences.backgroundGreen / 255,
                  blue: userPreferences.backgroundBlue / 255,
                  opacity: 1.0).edgesIgnoringSafeArea(.all)
                .edgesIgnoringSafeArea(.all)
            List {
                Section(header: Text("Display Settings")) {
                    HStack {
                        Button("Cool Morning Haze") {
                            userPreferences.updateColorScheme(backgroundRed: 29,
                                                              backgroundGreen: 32,
                                                              backgroundBlue: 37,
                                                              navButtonsRed: 29,
                                                              navButtonsGreen: 222,
                                                              navButtonsBlue: 203,
                                                              generalTextRed: 255,
                                                              generalTextGreen: 255,
                                                              generalTextBlue: 255,
                                                              arrowRed: 255,
                                                              arrowGreen: 255,
                                                              arrowBlue: 255,
                                                              rowBackgroundRed: 44,
                                                              rowBackgroundGreen: 68,
                                                              rowBackgroundBlue: 90,
                                                              blueGreyChecked: "checkmark",
                                                              checkmark1: "checkmark")
                        }
                        Spacer()
                        Image(systemName: userPreferences.blueGreyChecked)
                    }
                    HStack {
                        Button("Midnight Plum") {
                            userPreferences.updateColorScheme(backgroundRed: 21,
                                                              backgroundGreen: 21,
                                                              backgroundBlue: 21,
                                                              navButtonsRed: 180,
                                                              navButtonsGreen: 165,
                                                              navButtonsBlue: 165,
                                                              generalTextRed: 255,
                                                              generalTextGreen: 255,
                                                              generalTextBlue: 255,
                                                              arrowRed: 255,
                                                              arrowGreen: 255,
                                                              arrowBlue: 255,
                                                              rowBackgroundRed: 51,
                                                              rowBackgroundGreen: 41,
                                                              rowBackgroundBlue: 64,
                                                              midnightPlumChecked: "checkmark",
                                                              checkmark2: "checkmark")
                        }
                        Spacer()
                        Image(systemName: userPreferences.midnightPlumChecked)
                    }
                    HStack {
                        Button("True Dark") {
                            userPreferences.updateColorScheme(backgroundRed: 21,
                                                              backgroundGreen: 21,
                                                              backgroundBlue: 21,
                                                              navButtonsRed: 216,
                                                              navButtonsGreen: 146,
                                                              navButtonsBlue: 22,
                                                              generalTextRed: 255,
                                                              generalTextGreen: 255,
                                                              generalTextBlue: 255,
                                                              arrowRed: 216,
                                                              arrowGreen: 146,
                                                              arrowBlue: 22,
                                                              rowBackgroundRed: 35,
                                                              rowBackgroundGreen: 35,
                                                              rowBackgroundBlue: 35,
                                                              trueDarkChecked: "checkmark",
                                                              checkmark3: "checkmark")
                        }
                        Spacer()
                        Image(systemName: userPreferences.trueDarkChecked)
                    }
                    HStack {
                        Button("Vibrant") {
                            userPreferences.updateColorScheme(backgroundRed: 240,
                                                              backgroundGreen: 84,
                                                              backgroundBlue: 84,
                                                              navButtonsRed: 216,
                                                              navButtonsGreen: 146,
                                                              navButtonsBlue: 22,
                                                              generalTextRed: 255,
                                                              generalTextGreen: 255,
                                                              generalTextBlue: 255,
                                                              arrowRed: 216,
                                                              arrowGreen: 146,
                                                              arrowBlue: 22,
                                                              rowBackgroundRed: 35,
                                                              rowBackgroundGreen: 35,
                                                              rowBackgroundBlue: 35,
                                                              vibrantChecked: "checkmark",
                                                              checkmark4: "checkmark")
                        }
                        Spacer()
                        Image(systemName: userPreferences.vibrantChecked)
                    }
                }
                .navigationTitle("Settings")
                .listStyle(PlainListStyle())
                Section(header: Text("Default Train Line")) {
                    Picker("Selected Train Line", selection: $stationToPassToAPI) {
                        ForEach(stationArray, id: \.self) {
                            Text($0)
                        }
                        .onChange(of: stationToPassToAPI) { value in
                            userPreferences.selectedStation = stationToPassToAPI
                            userPreferences.saveDefaultStation()
                        }
                    }
                }
            }
            .onAppear {
                stationToPassToAPI = userPreferences.selectedStation
            }
        }
    }
}
