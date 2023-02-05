//
//  ListRow.swift
//  ListRow
//
//  Created by Nicholas Repaci on 7/23/21.
//

import Foundation
import SwiftUI

struct ListRow: View {
    
    // MARK: Properties
    @ObservedObject var userPrefrences: UserPreferences
    
    // MARK: Constants
    let model: StationModel
    
    // MARK: View
    var body: some View {
        VStack {
            ZStack {
                Color(red: userPrefrences.rowBackgroundRed / 255,
                      green: userPrefrences.rowBackgroundGreen / 255,
                      blue: userPrefrences.rowBackgroundBlue / 255,
                      opacity: 1.0)
                .cornerRadius(5)
                HStack {
                    Text(model.stationName)
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.thin)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .shadow(color: Color.black.opacity(0.2),
                                radius: 5,
                                x: 0,
                                y: 10)
                        .padding(.leading)
                    Spacer()
                }
                .padding([.top, .bottom], 15)
            }
            .shadow(color: Color.black.opacity(0.2),
                    radius: 5,
                    x: 0,
                    y: 10)
        }
    }
}

