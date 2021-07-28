//
//  SettingsView.swift
//  SettingsView
//
//  Created by Nicholas Repaci on 7/28/21.
//

import SwiftUI

class ChangeColor: ObservableObject {
    //@Published var colorScheme = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    @Published var red: Double = 0
    @Published var green: Double = 0
    @Published var blue: Double = 0
    public static let shared = ChangeColor()
}

struct SettingsView: View {
    
    //@StateObject var colorScheme = ChangeColor()
    var colorScheme = ChangeColor.shared
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("change colors") {
            colorScheme.red = 29
            colorScheme.green = 32
            colorScheme.blue = 37
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
