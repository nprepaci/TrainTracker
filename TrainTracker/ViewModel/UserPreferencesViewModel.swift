//
//  UserPreferences.swift
//  UserPreferences
//
//  Created by Nicholas Repaci on 7/29/21.
//

import Foundation
import SwiftUI

class UserPreferences: ObservableObject {
    @Published var selectedStation: String = UserDefaults.standard.string(forKey: "UserSelectedStation") ?? "A"
    
    @Published var backgroundRed: Double = UserDefaults.standard.double(forKey: "BackgroundRed")
    @Published var backgroundGreen: Double = UserDefaults.standard.double(forKey: "BackgroundGreen")
    @Published var backgroundBlue: Double = UserDefaults.standard.double(forKey: "BackgroundBlue")
    
    @Published var navButtonsRed: Double = UserDefaults.standard.double(forKey: "NavButtonRed")
    @Published var navButtonsGreen: Double = UserDefaults.standard.double(forKey: "NavButtonGreen")
    @Published var navButtonsBlue: Double = UserDefaults.standard.double(forKey: "NavButtonBlue")
    
    @Published var generalTextRed: Double = UserDefaults.standard.double(forKey: "TextRed")
    @Published var generalTextGreen: Double = UserDefaults.standard.double(forKey: "TextGreen")
    @Published var generalTextBlue: Double = UserDefaults.standard.double(forKey: "TextBlue")
    
    @Published var arrowRed: Double = UserDefaults.standard.double(forKey: "ArrowRed")
    @Published var arrowGreen: Double = UserDefaults.standard.double(forKey: "ArrowGreen")
    @Published var arrowBlue: Double = UserDefaults.standard.double(forKey: "ArrowBlue")
    
    @Published var rowBackgroundRed: Double = UserDefaults.standard.double(forKey: "ListRowRed")
    @Published var rowBackgroundGreen: Double = UserDefaults.standard.double(forKey: "ListRowGreen")
    @Published var rowBackgroundBlue: Double = UserDefaults.standard.double(forKey: "ListRowBlue")
    
    @Published var blueGreyChecked: String = UserDefaults.standard.string(forKey: "blueGreyChecked") ?? "checkmark"
    @Published var midnightPlumChecked: String = UserDefaults.standard.string(forKey: "midnightPlumChecked") ?? ""
    @Published var trueDarkChecked: String = UserDefaults.standard.string(forKey: "trueDarkChecked") ?? ""
    @Published var vibrantChecked: String = UserDefaults.standard.string(forKey: "vibrantChecked") ?? ""
    
    @Published var checkmark1 = UserDefaults.standard.string(forKey: "blueGreyChecked")
    @Published var checkmark2 = UserDefaults.standard.string(forKey: "midnightPlumChecked")
    @Published var checkmark3 = UserDefaults.standard.string(forKey: "trueDarkChecked")
    @Published var checkmark4 = UserDefaults.standard.string(forKey: "vibrantChecked")
    
    init() {
        handleNonOptionalUserDefaults()
    }
    
    func saveDefaultStation() {
        UserDefaults.standard.setValue(selectedStation, forKey: "UserSelectedStation")
        print("Save successful")
    }
    
    func updateColorScheme(backgroundRed: Double, backgroundGreen: Double, backgroundBlue: Double, navButtonsRed: Double, navButtonsGreen: Double, navButtonsBlue: Double, generalTextRed: Double, generalTextGreen: Double, generalTextBlue: Double, arrowRed: Double, arrowGreen: Double, arrowBlue: Double, rowBackgroundRed: Double, rowBackgroundGreen: Double, rowBackgroundBlue: Double, blueGreyChecked: String = "", midnightPlumChecked: String = "", trueDarkChecked: String = "", vibrantChecked: String = "", checkmark1: String = "", checkmark2: String = "", checkmark3: String = "", checkmark4: String = "") {
        
        self.backgroundRed = backgroundRed
        self.backgroundGreen = backgroundGreen
        self.backgroundBlue = backgroundBlue
        
        self.navButtonsRed = navButtonsRed
        self.navButtonsGreen = navButtonsGreen
        self.navButtonsBlue = navButtonsBlue
        
        self.generalTextRed = generalTextRed
        self.generalTextGreen = generalTextGreen
        self.generalTextBlue = generalTextBlue
        
        self.arrowRed = arrowRed
        self.arrowGreen = arrowGreen
        self.arrowBlue = arrowBlue
        
        self.rowBackgroundRed = rowBackgroundRed
        self.rowBackgroundGreen = rowBackgroundGreen
        self.rowBackgroundBlue = rowBackgroundBlue
        
        self.blueGreyChecked = blueGreyChecked
        self.midnightPlumChecked = midnightPlumChecked
        self.trueDarkChecked = trueDarkChecked
        self.vibrantChecked = vibrantChecked
        
        self.checkmark1 = checkmark1
        self.checkmark2 = checkmark2
        self.checkmark3 = checkmark3
        self.checkmark4 = checkmark4
        
        saveColorChoice()
    }
    
    func saveColorChoice() {
        UserDefaults.standard.setValue(backgroundRed, forKey: "BackgroundRed")
        UserDefaults.standard.setValue(backgroundGreen, forKey: "BackgroundGreen")
        UserDefaults.standard.setValue(backgroundBlue, forKey: "BackgroundBlue")
        
        UserDefaults.standard.setValue(navButtonsRed, forKey: "NavButtonRed")
        UserDefaults.standard.setValue(navButtonsGreen, forKey: "NavButtonGreen")
        UserDefaults.standard.setValue(navButtonsBlue, forKey: "NavButtonBlue")
        
        UserDefaults.standard.setValue(generalTextRed, forKey: "TextRed")
        UserDefaults.standard.setValue(generalTextGreen, forKey: "TextGreen")
        UserDefaults.standard.setValue(generalTextBlue, forKey: "TextBlue")
        
        UserDefaults.standard.setValue(arrowRed, forKey: "ArrowRed")
        UserDefaults.standard.setValue(arrowGreen, forKey: "ArrowGreen")
        UserDefaults.standard.setValue(arrowBlue, forKey: "ArrowBlue")
        
        UserDefaults.standard.setValue(rowBackgroundRed, forKey: "ListRowRed")
        UserDefaults.standard.setValue(rowBackgroundGreen, forKey: "ListRowGreen")
        UserDefaults.standard.setValue(rowBackgroundBlue, forKey: "ListRowBlue")
        
        UserDefaults.standard.setValue(blueGreyChecked, forKey: "blueGreyChecked")
        UserDefaults.standard.setValue(midnightPlumChecked, forKey: "midnightPlumChecked")
        UserDefaults.standard.setValue(trueDarkChecked, forKey: "trueDarkChecked")
        UserDefaults.standard.setValue(vibrantChecked, forKey: "vibrantChecked")
        
        UserDefaults.standard.setValue(blueGreyChecked, forKey: "checkmark1")
        UserDefaults.standard.setValue(midnightPlumChecked, forKey: "checkmark2")
        UserDefaults.standard.setValue(trueDarkChecked, forKey: "checkmark3")
        UserDefaults.standard.setValue(vibrantChecked, forKey: "checkmark4")
        print("Save succesful")
    }
    
    func handleNonOptionalUserDefaults() {
        // Need to handle non-optional user default value at launch
        if UserDefaults.standard.double(forKey: "BackgroundRed") == 0 {
            backgroundRed = 29
            backgroundGreen = 32
            backgroundBlue = 37
            navButtonsRed = 29
            navButtonsGreen = 222
            navButtonsBlue = 203
            generalTextRed = 255
            generalTextGreen = 255
            generalTextBlue = 255
            arrowRed = 255
            arrowGreen = 255
            arrowBlue = 255
            rowBackgroundRed = 44
            rowBackgroundGreen = 68
            rowBackgroundBlue = 90
        }
    }
}
