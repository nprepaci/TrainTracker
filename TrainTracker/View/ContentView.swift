//
//  ContentView.swift
//  TrainTracker
//
//  Created by Nicholas Repaci on 7/20/21.
//


import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.changeColor.backgroundRed = UserDefaults.standard.double(forKey: "BackgroundRed")
        self.changeColor.backgroundGreen = UserDefaults.standard.double(forKey: "BackgroundGreen")
        self.changeColor.backgroundBlue = UserDefaults.standard.double(forKey: "BackgroundBlue")
        
        self.changeColor.navButtonsRed = UserDefaults.standard.double(forKey: "NavButtonRed")
        self.changeColor.navButtonsGreen = UserDefaults.standard.double(forKey: "NavButtonGreen")
        self.changeColor.navButtonsBlue = UserDefaults.standard.double(forKey: "NavButtonBlue")
        
        self.changeColor.generalTextRed = UserDefaults.standard.double(forKey: "TextRed")
        self.changeColor.generalTextGreen = UserDefaults.standard.double(forKey: "TextGreen")
        self.changeColor.generalTextBlue = UserDefaults.standard.double(forKey: "TextBlue")
        
        self.changeColor.arrowRed = UserDefaults.standard.double(forKey: "ArrowRed")
        self.changeColor.arrowGreen = UserDefaults.standard.double(forKey: "ArrowGreen")
        self.changeColor.arrowBlue = UserDefaults.standard.double(forKey: "ArrowBlue")
        
        self.changeColor.rowBackgroundRed = UserDefaults.standard.double(forKey: "ListRowRed")
        self.changeColor.rowBackgroundGreen = UserDefaults.standard.double(forKey: "ListRowGreen")
        self.changeColor.rowBackgroundBlue = UserDefaults.standard.double(forKey: "ListRowBlue")
        
        self.changeColor.blueGreyChecked = UserDefaults.standard.string(forKey: "blueGreyChecked") ?? ""
        self.changeColor.midnightPlumChecked = UserDefaults.standard.string(forKey: "midnightPlumChecked") ?? ""
        self.changeColor.trueDarkChecked = UserDefaults.standard.string(forKey: "trueDarkChecked") ?? ""
        self.changeColor.vibrantChecked = UserDefaults.standard.string(forKey: "vibrantChecked") ?? ""
   }
    
    @State var changeColor = ChangeColor.shared
    @StateObject var api = API()
    @State private var angle: Double = 0
    //@State var timediff = ""
    //let impactMed = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0).edgesIgnoringSafeArea(.all)
                List {
                    ForEach(self.api.storedData.data, id: \.id) { index in
                        NavigationLink(destination: ArrivalsView(stationName: index.name ?? "", northRoute: index.n ?? [NS].init(), southRoute: index.s ?? [NS].init())) {
                            ListRow(stationName: index.name ?? "")
                        }
                        //.onTapGesture {
                         //let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                                    //impactHeavy.impactOccurred()
                        //}
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0))
                        
                    }
                    .padding(.bottom, 40)
                }
                //.listRowSeparator(.hidden)
                .listStyle(PlainListStyle())
                .onAppear { api.loadData()}
                .navigationBarTitle("Station").foregroundColor(.white).colorScheme(.dark)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack {
                            NavigationLink(destination: ChangeStationView()) {
                                Image(systemName: "slider.horizontal.3").foregroundColor(Color(red: changeColor.navButtonsRed/255, green: changeColor.navButtonsGreen/255, blue: changeColor.navButtonsBlue/255, opacity: 1.0))
                            }.simultaneousGesture(TapGesture().onEnded{
                                angle += 360
                            }).rotationEffect(.degrees(angle))
                                .animation(.easeIn, value: angle)
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape").foregroundColor(Color(red: changeColor.navButtonsRed/255, green: changeColor.navButtonsGreen/255, blue: changeColor.navButtonsBlue/255, opacity: 1.0))
                        }.simultaneousGesture(TapGesture().onEnded{
                            angle += 360
                        }).rotationEffect(.degrees(angle))
                            .animation(.easeIn, value: angle)
                    }
                }
            }
            Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0).edgesIgnoringSafeArea(.all)
        }
    }
}
