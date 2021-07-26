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
    @State var stationName: String
    //@EnvironmentObject var changeStation: SelectedStation
    var chosenStation = SelectedStation.shared
    var contentView = ContentView()
    
    
    var body: some View {
        VStack {
            HStack{
                Button("1") {
                    chosenStation.selectedStation = "1"
                }
                Button("2") {
                    chosenStation.selectedStation = "2"
                }
                Button("3") {
                    chosenStation.selectedStation = "3"
                }
            }
            HStack{
                Button("4") {
                    chosenStation.selectedStation = "4"
                }
                Button("5") {
                    chosenStation.selectedStation = "5"
                }
                Button("6") {
                    chosenStation.selectedStation = "6"
                }
                Button("7") {
                    chosenStation.selectedStation = "7"
                }
            }
            HStack{
                Button("A") {
                    chosenStation.selectedStation = "A"
                }
                Button("C") {
                    chosenStation.selectedStation = "C"
                }
                Button("E") {
                    chosenStation.selectedStation = "E"
                }
            }
            HStack{
                Button("N") {
                    chosenStation.selectedStation = "N"
                }
                Button("Q") {
                    chosenStation.selectedStation = "Q"
                }
                Button("R") {
                    chosenStation.selectedStation = "R"
                }
                Button("W") {
                    chosenStation.selectedStation = "W"
                }
            }
            HStack{
                Button("B") {
                    chosenStation.selectedStation = "B"
                }
                Button("D") {
                    chosenStation.selectedStation = "D"
                }
                Button("F") {
                    chosenStation.selectedStation = "F"
                }
                Button("M") {
                    chosenStation.selectedStation = "M"
                }
            }
            HStack{
                Button("L") {
                    chosenStation.selectedStation = "L"
                }
                Button("G") {
                    chosenStation.selectedStation = "G"
                }
                Button("J") {
                    chosenStation.selectedStation = "J"
                }
                Button("Z") {
                    chosenStation.selectedStation = "Z"
                }
            }
            
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
                
            }
        }
    }
}

struct ChangeStationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStationView(stationName: String.init())
    }
}
