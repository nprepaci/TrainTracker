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
    var changeColor = ChangeColor.shared
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
           // backgroundColor.edgesIgnoringSafeArea(.all)
            Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    VStack {
                        HStack(alignment: .top) {
                            Text("Change Line").foregroundColor(.white).font(.system(size: 40)).fontWeight(.thin)
                            Spacer()
                        }.padding(.leading)
                        GeometryReader { geometry in
                            Color.gray.frame(width: geometry.size.width/1.65, height:CGFloat(1))
                        }
                    }
                    LazyVGrid(columns: columns, spacing: 50) {
                        ForEach(buttonArray, id: \.self) { index in
                            Button {
                                chosenStation.selectedStation = index
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image("\(index)").resizable().frame(width: 60, height: 60).shadow(color: shadowColor, radius: 3, x: 0, y: 0)
                            }.rotationEffect(.degrees(angle))
                                .animation(.easeInOut, value: angle)
                        }
                    }
                    Spacer()
                }
            }
            .animation(.spring().speed(0.75))
            .padding(.top)
            .navigationBarTitle(Text(""), displayMode: .inline)
            .onAppear {
                angle += 720
            }
        }
    }
}

struct ChangeStationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStationView()
    }
}
