//
//  ArrivalsView.swift
//  ArrivalsView
//
//  Created by Nicholas Repaci on 7/23/21.
//

import SwiftUI

struct ArrivalsView: View {
    
    var stationName: String
    var northRoute: [NS]
    var southRoute: [NS]
    
    var body: some View {
        HStack {
            VStack {
                ForEach(northRoute, id: \.self) { index in
                    Text(index.route ?? "")
                }
            }
            VStack {
                ForEach(southRoute, id: \.self) { index in
                    Text(index.route ?? "")
                }
                
            }
        }
        .navigationBarTitle(stationName, displayMode: .inline)
    }
}

struct ArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalsView(stationName: String.init(), northRoute: [NS].init(), southRoute: [NS].init())
    }
}
