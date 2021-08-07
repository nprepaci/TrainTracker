//
//  ChangeColor.swift
//  ChangeColor
//
//  Created by Nicholas Repaci on 7/29/21.
//

import Foundation
import SwiftUI

class ChangeColor: ObservableObject {
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
    
    @Published var blueGreyChecked: String = "checkmark"
    @Published var midnightPlumChecked: String = ""
    @Published var trueDarkChecked: String = ""
    @Published var vibrantChecked: String = ""
    
    public static let shared = ChangeColor()
    
}

class SelectedStation: ObservableObject {
    @Published var selectedStation: String = "A"
    public static let shared = SelectedStation()
}

class SaveData {
    
    var colorScheme = ChangeColor.shared
    var changeStation = SelectedStation.shared
    
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
        
        UserDefaults.standard.set(colorScheme.blueGreyChecked, forKey: "blueGreyChecked")
        UserDefaults.standard.set(colorScheme.midnightPlumChecked, forKey: "midnightPlumChecked")
        UserDefaults.standard.set(colorScheme.trueDarkChecked, forKey: "trueDarkChecked")
        UserDefaults.standard.set(colorScheme.vibrantChecked, forKey: "vibrantChecked")
    }
    
    func saveDefaultStation() {
        UserDefaults.standard.set(changeStation.selectedStation, forKey: "UserSelectedStation")
        print("Save successful")
    }
}
