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
            Button("A") {
                //self.changeStation.selectedStation = "6"
                chosenStation.selectedStation = "R"
                api.loadData()
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
