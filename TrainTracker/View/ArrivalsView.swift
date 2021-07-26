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
    var fmt = ISO8601DateFormatter()
   // @State var timediff = ""
    
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
                                let timeDifference = calculateTimeDifference(arrivalTime: index.time ?? "")
                                Text(timeDifference ?? "").foregroundColor(.orange)
                                //Text(Date(), style: .time).foregroundColor(.orange)
                                
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
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .navigationBarTitle(stationName, displayMode: .inline)
                
                //}
            } .onAppear {

            }
        }
    }
    func calculateTimeDifference(arrivalTime: String?) -> String? {
        let RFC3339DateFormatter = DateFormatter()
                    RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
                    RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
                    RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
                    
                    let currentTime = "2021-07-26T00:25:13-04:00"
                    let date1 = RFC3339DateFormatter.date(from: currentTime)
                    let trainArrivalTime = arrivalTime
                    let date2 = RFC3339DateFormatter.date(from: trainArrivalTime ?? "")
                    var timeDifference = ""
        
        
        
        
                    if let d1 = date1, let d2 = date2 {
                        let (hours, minutes) = timeDiff(d1,d2)
                        timeDifference = "\(minutes) min"
                        //timeDifference = "[\(hours):\(minutes)]"
                        //print("---> time diff hours: \(hours)  minutes: \(minutes) ")
                    }
            return timeDifference
    }
    
    func timeDiff(_ t1: Date, _ t2: Date) -> (Int, Int) {
        
        let date = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        
        
            let m1 = Calendar.current.component(.minute, from: t1)
            let h1 = Calendar.current.component(.hour, from: t1)
            
            let m2 = Calendar.current.component(.minute, from: t2)
            let h2 = Calendar.current.component(.hour, from: t2)
            // hours and minutes
            return (abs(h2-h1), abs(m2-m1))
        }
    
}

struct ArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalsView(stationName: String.init(), northRoute: [NS].init(), southRoute: [NS].init())
    }
}
