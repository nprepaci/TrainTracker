//
//  SettingsView.swift
//  SettingsView
//
//  Created by Nicholas Repaci on 7/28/21.
//

import SwiftUI

struct SettingsView: View {
    
    var colorScheme = ChangeColor.shared
    var saveData = SaveData()
    @State private var checkmark1 = ""
    @State private var checkmark2 = ""
    @State private var checkmark3 = ""
    @State private var checkmark4 = ""
    
    var body: some View {
        ZStack {
            Color(red: colorScheme.backgroundRed/255, green: colorScheme.backgroundGreen/255, blue: colorScheme.backgroundBlue/255, opacity: 1.0).edgesIgnoringSafeArea(.all).edgesIgnoringSafeArea(.all)
            List {
                Section(header: Text("Display Settings")) {
                    HStack {
                        Button("Cool Morning Haze") {
                            colorScheme.backgroundRed = 29
                            colorScheme.backgroundGreen = 32
                            colorScheme.backgroundBlue = 37
                            
                            colorScheme.navButtonsRed = 29
                            colorScheme.navButtonsGreen = 222
                            colorScheme.navButtonsBlue = 203
                            
                            colorScheme.generalTextRed = 255
                            colorScheme.generalTextGreen = 255
                            colorScheme.generalTextBlue = 255
                            
                            colorScheme.arrowRed = 255
                            colorScheme.arrowGreen = 255
                            colorScheme.arrowBlue = 255
                            
                            colorScheme.rowBackgroundRed = 46
                            colorScheme.rowBackgroundGreen = 68
                            colorScheme.rowBackgroundBlue = 90
                            
                            colorScheme.blueGreyChecked = "checkmark"
                            colorScheme.midnightPlumChecked = ""
                            colorScheme.trueDarkChecked = ""
                            colorScheme.vibrantChecked = ""
                            checkmark1 = "checkmark"
                            checkmark2 = ""
                            checkmark3 = ""
                            checkmark4 = ""
                            saveData.saveColorChoice()
                        }
                        Spacer()
                        Image(systemName: checkmark1)
                    }
                    
                    HStack {
                        Button("Midnight Plum") {
                            colorScheme.backgroundRed = 21
                            colorScheme.backgroundGreen = 21
                            colorScheme.backgroundBlue = 21
                            
                            colorScheme.navButtonsRed = 180
                            colorScheme.navButtonsGreen = 165
                            colorScheme.navButtonsBlue = 165
                            
                            colorScheme.generalTextRed = 255
                            colorScheme.generalTextGreen = 255
                            colorScheme.generalTextBlue = 255
                            
                            colorScheme.arrowRed = 255
                            colorScheme.arrowGreen = 255
                            colorScheme.arrowBlue = 255
                            
                            colorScheme.rowBackgroundRed = 51
                            colorScheme.rowBackgroundGreen = 41
                            colorScheme.rowBackgroundBlue = 64
                            
                            colorScheme.blueGreyChecked = ""
                            colorScheme.midnightPlumChecked = "checkmark"
                            colorScheme.trueDarkChecked = ""
                            colorScheme.vibrantChecked = ""
                            checkmark1 = ""
                            checkmark2 = "checkmark"
                            checkmark3 = ""
                            checkmark4 = ""
                            
                            saveData.saveColorChoice()
                        }
                        Spacer()
                        Image(systemName: checkmark2)
                    }
                    
                    HStack {
                        Button("True Dark") {
                            colorScheme.backgroundRed = 21
                            colorScheme.backgroundGreen = 21
                            colorScheme.backgroundBlue = 21
                            
                            colorScheme.navButtonsRed = 216
                            colorScheme.navButtonsGreen = 146
                            colorScheme.navButtonsBlue = 22
                            
                            colorScheme.generalTextRed = 255
                            colorScheme.generalTextGreen = 255
                            colorScheme.generalTextBlue = 255
                            
                            colorScheme.arrowRed = 216
                            colorScheme.arrowGreen = 146
                            colorScheme.arrowBlue = 22
                            
                            colorScheme.rowBackgroundRed = 35
                            colorScheme.rowBackgroundGreen = 35
                            colorScheme.rowBackgroundBlue = 35
                            
                            ////THIS IS A NICE GREY
                            //            colorScheme.rowBackgroundRed = 43
                            //            colorScheme.rowBackgroundGreen = 43
                            //            colorScheme.rowBackgroundBlue = 43
                            //
                            
                            colorScheme.blueGreyChecked = ""
                            colorScheme.midnightPlumChecked = ""
                            colorScheme.trueDarkChecked = "checkmark"
                            colorScheme.vibrantChecked = ""
                            checkmark1 = ""
                            checkmark2 = ""
                            checkmark3 = "checkmark"
                            checkmark4 = ""
                            
                            saveData.saveColorChoice()
                        }
                        Spacer()
                        Image(systemName: checkmark3)
                    }
                    
                    HStack {
                        Button("Vibrant") {
                            colorScheme.backgroundRed = 240
                            colorScheme.backgroundGreen = 84
                            colorScheme.backgroundBlue = 84
                            
                            colorScheme.navButtonsRed = 216
                            colorScheme.navButtonsGreen = 146
                            colorScheme.navButtonsBlue = 22
                            
                            colorScheme.generalTextRed = 255
                            colorScheme.generalTextGreen = 255
                            colorScheme.generalTextBlue = 255
                            
                            colorScheme.arrowRed = 216
                            colorScheme.arrowGreen = 146
                            colorScheme.arrowBlue = 22
                            
                            colorScheme.rowBackgroundRed = 35
                            colorScheme.rowBackgroundGreen = 35
                            colorScheme.rowBackgroundBlue = 35
                            
                            ////THIS IS A NICE GREY
                            //            colorScheme.rowBackgroundRed = 43
                            //            colorScheme.rowBackgroundGreen = 43
                            //            colorScheme.rowBackgroundBlue = 43
                            //
                            
                            colorScheme.blueGreyChecked = ""
                            colorScheme.midnightPlumChecked = ""
                            colorScheme.trueDarkChecked = ""
                            colorScheme.vibrantChecked = "checkmark"
                            checkmark1 = ""
                            checkmark2 = ""
                            checkmark3 = ""
                            checkmark4 = "checkmark"
                            
                            saveData.saveColorChoice()
                        }
                        Spacer()
                        Image(systemName: checkmark4)
                    }
                }
                .navigationTitle("Settings")
                .listStyle(PlainListStyle())
                .onAppear {
                    checkmark1 = colorScheme.blueGreyChecked
                    checkmark2 = colorScheme.midnightPlumChecked
                    checkmark3 = colorScheme.trueDarkChecked
                    checkmark4 = colorScheme.vibrantChecked
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
