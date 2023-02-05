//
//  ChangeStationView.swift
//  ChangeStationView
//
//  Created by Nicholas Repaci on 7/24/21.
//

import SwiftUI

struct ChangeStationView: View {
    
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    @State private var angle: Double = 0
    @ObservedObject var userPreferences: UserPreferences
    var shadowColor = Color(red: 182/255, green: 239/255, blue: 162/255, opacity: 1.0)
    var buttonArray = ["1", "2", "3", "4", "5", "6", "7", "A", "C", "E", "N", "Q", "R", "W", "B", "D", "F", "M", "L", "G", "J", "Z"]
    
    // MARK: Constants
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    // MARK: View
    var body: some View {
        ZStack {
            Color(red: userPreferences.backgroundRed / 255,
                  green: userPreferences.backgroundGreen / 255,
                  blue: userPreferences.backgroundBlue / 255,
                  opacity: 1.0)
            .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    VStack {
                        HStack(alignment: .top) {
                            Text("Change Line")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                                .fontWeight(.thin)
                            Spacer()
                        }
                        .padding(.leading)
                        GeometryReader { geometry in
                            Color.gray.frame(width: geometry.size.width / 1.65, height: 1.0)
                        }
                    }
                    LazyVGrid(columns: columns, spacing: 50) {
                        ForEach(buttonArray, id: \.self) { index in
                            Button {
                                userPreferences.selectedStation = index
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image("\(index)")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .shadow(color: shadowColor,
                                            radius: 3,
                                            x: 0,
                                            y: 0)
                            }
                            .rotationEffect(.degrees(angle))
                                .animation(.easeInOut,
                                           value: angle)
                        }
                    }
                    Spacer()
                }
            }
            .animation(.spring()
                .speed(0.75))
            .padding(.top)
            .navigationBarTitle(Text(""), displayMode: .inline)
            .onAppear {
                angle += 720
            }
        }
    }
}
