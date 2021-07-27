//
//  ChangeStationView.swift
//  ChangeStationView
//
//  Created by Nicholas Repaci on 7/24/21.
//

import SwiftUI

struct ChangeStationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var api = API()
    var chosenStation = SelectedStation.shared
    var contentView = ContentView()
    var backgroundColor = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    var shadowColor = Color(red: 182/255, green: 239/255, blue: 162/255, opacity: 1.0)
    @State private var angle: Double = 0
    
    var buttonArray = ["1", "2", "3", "4", "5", "6", "7", "A", "C", "E", "N", "Q", "R", "W", "B", "D", "F", "M", "L", "G", "J", "Z"]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    HStack(alignment: .top) {
                        Text("Change Station").foregroundColor(.white).font(.largeTitle).fontWeight(.thin)
                        Spacer()
                    }.padding(.leading)
                    LazyVGrid(columns: columns, spacing: 60) {
                        ForEach(buttonArray, id: \.self) { index in
                            Button {
                                chosenStation.selectedStation = index
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image("\(index)").resizable().frame(width: 60, height: 60).shadow(color: shadowColor, radius: 3, x: 0, y: 0)
                            }.rotationEffect(.degrees(angle))
                                .animation(.easeIn, value: angle)
                        }
                    }
                    Spacer()
                }
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .onAppear {
                angle += 360
            }
        }
    }
}

struct ChangeStationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStationView()
    }
}
