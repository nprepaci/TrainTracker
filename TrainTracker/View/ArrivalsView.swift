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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ForEach(northRoute, id: \.self) { index in
            Text(index.route ?? "")
        }
            .navigationBarTitle(stationName, displayMode: .inline)
    }
}

struct ArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalsView(stationName: String.init(), northRoute: [NS].init())
    }
}
