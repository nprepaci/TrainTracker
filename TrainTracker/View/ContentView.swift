//
//  ContentView.swift
//  TrainTracker
//
//  Created by Nicholas Repaci on 7/20/21.
//


import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    @StateObject var userPreferences = UserPreferences()
    @StateObject var viewModel = TrainDataViewModel()
    @State private var angle: Double = 0
    
    // MARK: Constants
    let screenWidth = UIScreen.main.bounds.width
    
    // MARK: Init
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    // MARK: View
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: userPreferences.backgroundRed / 255,
                      green: userPreferences.backgroundGreen / 255,
                      blue: userPreferences.backgroundBlue / 255,
                      opacity: 1.0)
                .edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.storedData.data, id: \.id) { item in
                        let arrivalsModel = ArrivalsModel(stationName: item.name ?? "",
                                                          northRoute: item.n ?? [NS].init(),
                                                          southRoute: item.s ?? [NS].init())
                        NavigationLink {
                            ArrivalsView(viewModel: viewModel,
                                         userPreferences: userPreferences,
                                         model: arrivalsModel)
                        } label: {
                            ListRow(userPrefrences: userPreferences,
                                    stationName: item.name ?? "")
                            .frame(width: screenWidth - 20)
                            .padding(.bottom, 10)
                        }
                    }
                }
                .onAppear {
                    viewModel.loadData(selectedStation: userPreferences.selectedStation)
                }
                .navigationBarTitle("Station")
                .foregroundColor(.white)
                .colorScheme(.dark)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            NavigationLink(destination: ChangeStationView(userPreferences: userPreferences)) {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(Color(red: userPreferences.navButtonsRed / 255,
                                                           green: userPreferences.navButtonsGreen / 255,
                                                           blue: userPreferences.navButtonsBlue / 255,
                                                           opacity: 1.0))
                            }
                            .simultaneousGesture(TapGesture().onEnded{
                                angle += 360
                            })
                            .rotationEffect(.degrees(angle))
                            .animation(.easeIn, value: angle)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: SettingsView(userPreferences: userPreferences)) {
                            Image(systemName: "gearshape")
                                .foregroundColor(Color(red: userPreferences.navButtonsRed / 255,
                                                       green: userPreferences.navButtonsGreen / 255,
                                                       blue: userPreferences.navButtonsBlue / 255,
                                                       opacity: 1.0))
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            angle += 360
                        })
                        .rotationEffect(.degrees(angle))
                        .animation(.easeIn, value: angle)
                    }
                }
            }
            Color(red: userPreferences.backgroundRed / 255,
                  green: userPreferences.backgroundGreen / 255,
                  blue: userPreferences.backgroundBlue / 255,
                  opacity: 1.0)
            .edgesIgnoringSafeArea(.all)
        }
    }
}
