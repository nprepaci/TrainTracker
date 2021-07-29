//
//  SettingsView.swift
//  SettingsView
//
//  Created by Nicholas Repaci on 7/28/21.
//

import SwiftUI

class ChangeColor: ObservableObject {
    //@Published var colorScheme = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    @Published var backgroundRed: Double = 29
    @Published var backgroundGreen: Double = 32
    @Published var backgroundBlue: Double = 37
    
    @Published var navButtonsRed: Double = 29
    @Published var navButtonsGreen: Double = 222
    @Published var navButtonsBlue: Double = 203
    
    @Published var generalTextRed: Double = 29
    @Published var generalTextGreen: Double = 222
    @Published var generalTextBlue: Double = 203
    
    @Published var rowBackgroundRed: Double = 46
    @Published var rowBackgroundGreen: Double = 68
    @Published var rowBackgroundBlue: Double = 90
    
    public static let shared = ChangeColor()
}



struct SettingsView: View {
    
    //@StateObject var colorScheme = ChangeColor()
    var colorScheme = ChangeColor.shared
    
    var body: some View {
        Button("Blue/Grey") {
            colorScheme.backgroundRed = 29
            colorScheme.backgroundGreen = 32
            colorScheme.backgroundBlue = 37
            
            colorScheme.navButtonsRed = 29
            colorScheme.navButtonsGreen = 222
            colorScheme.navButtonsBlue = 203
            
            colorScheme.generalTextRed = 185
            colorScheme.generalTextGreen = 239
            colorScheme.generalTextBlue = 165
            
            colorScheme.rowBackgroundRed = 46
            colorScheme.rowBackgroundGreen = 68
            colorScheme.rowBackgroundBlue = 90
        }
        
        Button("Midnight Plum") {
            colorScheme.backgroundRed = 21
            colorScheme.backgroundGreen = 21
            colorScheme.backgroundBlue = 21
            
            colorScheme.navButtonsRed = 180
            colorScheme.navButtonsGreen = 165
            colorScheme.navButtonsBlue = 165
            
            colorScheme.generalTextRed = 170
            colorScheme.generalTextGreen = 150
            colorScheme.generalTextBlue = 83
//            colorScheme.generalTextRed = 60
//            colorScheme.generalTextGreen = 65
//            colorScheme.generalTextBlue = 92
            
            colorScheme.rowBackgroundRed = 51
            colorScheme.rowBackgroundGreen = 41
            colorScheme.rowBackgroundBlue = 64
            
//            colorScheme.rowBackgroundRed = 31
//            colorScheme.rowBackgroundGreen = 26
//            colorScheme.rowBackgroundBlue = 36
        }
        Button("True Dark") {
            colorScheme.backgroundRed = 0
            colorScheme.backgroundGreen = 0
            colorScheme.backgroundBlue = 0
            
            colorScheme.navButtonsRed = 29
            colorScheme.navButtonsGreen = 222
            colorScheme.navButtonsBlue = 203
            
            colorScheme.generalTextRed = 185
            colorScheme.generalTextGreen = 239
            colorScheme.generalTextBlue = 165
            
            colorScheme.rowBackgroundRed = 31
            colorScheme.rowBackgroundGreen = 26
            colorScheme.rowBackgroundBlue = 36
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
