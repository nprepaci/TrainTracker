//
//  ChangeStationView.swift
//  ChangeStationView
//
//  Created by Nicholas Repaci on 7/24/21.
//

import SwiftUI

struct ChangeStationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    //@State var stationName: String
    var api = API()
    var chosenStation = SelectedStation.shared
    var contentView = ContentView()
    
    var buttonArray = ["1", "2", "3", "4", "5", "6", "7", "A", "C", "E", "N", "Q", "R", "W", "B", "D", "F", "M", "L", "G", "J", "Z"]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(buttonArray, id: \.self) { index in
                    Button {
                        chosenStation.selectedStation = index
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("\(index)").resizable().frame(width: 40, height: 40)
                    }

                }
            }
        }
    }
}

struct ChangeStationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStationView()
    }
}


//        Group {
//        VStack {
//            HStack {
//                Button("1") {
//                    chosenStation.selectedStation = "1"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("2") {
//                    chosenStation.selectedStation = "2"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("3") {
//                    chosenStation.selectedStation = "3"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Button("4") {
//                    chosenStation.selectedStation = "4"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("5") {
//                    chosenStation.selectedStation = "5"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("6") {
//                    chosenStation.selectedStation = "6"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("7") {
//                    chosenStation.selectedStation = "7"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Button("A") {
//                    chosenStation.selectedStation = "A"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("C") {
//                    chosenStation.selectedStation = "C"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("E") {
//                    chosenStation.selectedStation = "E"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Button("N") {
//                    chosenStation.selectedStation = "N"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("Q") {
//                    chosenStation.selectedStation = "Q"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("R") {
//                    chosenStation.selectedStation = "R"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("W") {
//                    chosenStation.selectedStation = "W"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Spacer()
//            }
//            Spacer()
//            HStack {
//                Button("B") {
//                    chosenStation.selectedStation = "B"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("D") {
//                    chosenStation.selectedStation = "D"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("F") {
//                    chosenStation.selectedStation = "F"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("M") {
//                    chosenStation.selectedStation = "M"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Spacer()
//            }
//            HStack{
//                Button("L") {
//                    chosenStation.selectedStation = "L"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("G") {
//                    chosenStation.selectedStation = "G"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("J") {
//                    chosenStation.selectedStation = "J"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Button("Z") {
//                    chosenStation.selectedStation = "Z"
//                    presentationMode.wrappedValue.dismiss()
//                }
//                Spacer()
//            }
//        }
//        }
