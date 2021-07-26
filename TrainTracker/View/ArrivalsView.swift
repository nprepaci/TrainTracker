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
    var backgroundColor = Color.black
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView {
                // ZStack {
                // backgroundColor.edgesIgnoringSafeArea(.all)
                HStack(alignment: .top) {
                    VStack {
                        ForEach(northRoute, id: \.self) { index in
                            HStack {
                                Image(systemName: "arrow.up.circle").foregroundColor(.white).font(.custom("AvenirNext-Regular", size: 20))
                                Text(index.route ?? "").foregroundColor(.white).font(.custom("AvenirNext-Regular", size: 20))
                                
                                //ListRow(stationName: index.route ?? "")
                                
                            }
                            .padding(.bottom, 50)
                        }
                    }
                    Spacer()
                    VStack {
                        ForEach(southRoute, id: \.self) { index in
                            HStack {
                                Image(systemName: "arrow.down.circle").foregroundColor(.white).font(.custom("AvenirNext-Regular", size: 20))
                                Text(index.route ?? "").foregroundColor(.white).font(.custom("AvenirNext-Regular", size: 20))
                                
                                //ListRow(stationName: index.route ?? "")
                                //Spacer()
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .navigationBarTitle(stationName, displayMode: .inline)
                
                //}
            }
        }
    }
    
}

struct ArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalsView(stationName: String.init(), northRoute: [NS].init(), southRoute: [NS].init())
    }
}
