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
    
    @Published var arrowRed: Double = 255
    @Published var arrowGreen: Double = 255
    @Published var arrowBlue: Double = 255
    
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
            
            colorScheme.generalTextRed = 255
            colorScheme.generalTextGreen = 255
            colorScheme.generalTextBlue = 255
            
            colorScheme.arrowRed = 255
            colorScheme.arrowGreen = 255
            colorScheme.arrowBlue = 255
            
            colorScheme.rowBackgroundRed = 46
            colorScheme.rowBackgroundGreen = 68
            colorScheme.rowBackgroundBlue = 90
            
            saveColorChoice()
        }
        
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
//            colorScheme.generalTextRed = 60
//            colorScheme.generalTextGreen = 65
//            colorScheme.generalTextBlue = 92
            
            colorScheme.arrowRed = 255
            colorScheme.arrowGreen = 255
            colorScheme.arrowBlue = 255
            
            colorScheme.rowBackgroundRed = 51
            colorScheme.rowBackgroundGreen = 41
            colorScheme.rowBackgroundBlue = 64
            
//            colorScheme.rowBackgroundRed = 31
//            colorScheme.rowBackgroundGreen = 26
//            colorScheme.rowBackgroundBlue = 36
            
            saveColorChoice()
        }
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
            saveColorChoice()
        }
    }
    
    func saveColorChoice() {
        UserDefaults.standard.set(colorScheme.backgroundRed, forKey: "BackgroundRed")
        UserDefaults.standard.set(colorScheme.backgroundGreen, forKey: "BackgroundGreen")
        UserDefaults.standard.set(colorScheme.backgroundBlue, forKey: "BackgroundBlue")
        
        UserDefaults.standard.set(colorScheme.navButtonsRed, forKey: "NavButtonRed")
        UserDefaults.standard.set(colorScheme.navButtonsGreen, forKey: "NavButtonGreen")
        UserDefaults.standard.set(colorScheme.navButtonsBlue, forKey: "NavButtonBlue")
        
        UserDefaults.standard.set(colorScheme.generalTextRed, forKey: "TextRed")
        UserDefaults.standard.set(colorScheme.generalTextGreen, forKey: "TextGreen")
        UserDefaults.standard.set(colorScheme.generalTextBlue, forKey: "TextBlue")
        
        UserDefaults.standard.set(colorScheme.arrowRed, forKey: "ArrowRed")
        UserDefaults.standard.set(colorScheme.arrowGreen, forKey: "ArrowGreen")
        UserDefaults.standard.set(colorScheme.arrowBlue, forKey: "ArrowBlue")
        
        UserDefaults.standard.set(colorScheme.rowBackgroundRed, forKey: "ListRowRed")
        UserDefaults.standard.set(colorScheme.rowBackgroundGreen, forKey: "ListRowGreen")
        UserDefaults.standard.set(colorScheme.rowBackgroundBlue, forKey: "ListRowBlue")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
