//
//  ChangeStationView.swift
//  ChangeStationView
//
//  Created by Nicholas Repaci on 7/24/21.
//

import SwiftUI

struct ChangeStationView: View {
    
    var api = API()
    
    @State var stationName: String
    @EnvironmentObject var changeStation: SelectedStation
    var chosenStation = SelectedStation.shared

    
    var body: some View {
        Button("A") {
            //self.changeStation.selectedStation = "6"
            chosenStation.selectedStation = "R"
            api.loadData()
        }
    }
}

struct ChangeStationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStationView(stationName: String.init())
    }
}