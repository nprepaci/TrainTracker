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
    var backgroundColor = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    
    var body: some View {
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView {
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
                                let timeDifference = calculateTimeDifference(arrivalTime: index.time ?? "")
                                Text(timeDifference ?? "").foregroundColor(.orange)
                                //ListRow(stationName: index.route ?? "")
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .navigationBarTitle(stationName, displayMode: .inline)
            }
            
            VStack {
                Spacer()
                Divider().foregroundColor(.orange)
                HStack {
                    Image(systemName: "arrow.up.circle").foregroundColor(.white)
                    Text("Uptown").fontWeight(.thin)
                    Image(systemName: "arrow.down.circle").foregroundColor(.white)
                    Text("Downtown").fontWeight(.thin)
                }
            }
        }
    }
    func calculateTimeDifference(arrivalTime: String?) -> String? {
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let trainArrivalTime = arrivalTime
        let date2 = RFC3339DateFormatter.date(from: trainArrivalTime ?? "")
        var timeDifference = ""
        
        if let d2 = date2 {
            let (minutes) = timeDiff(d2)
            timeDifference = "\(minutes) min"
        }
        return timeDifference
    }
    
    func timeDiff(_ t2: Date) -> (Int) {
        
        let date = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let m2 = Calendar.current.component(.minute, from: t2)
        
        //handles the issue if train times do not fall within the same hour
        if m2 > minutes {
            return (abs(m2-minutes))
        } else {
            return (abs(minutes-m2))
        }
    }
}

struct ArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalsView(stationName: String.init(), northRoute: [NS].init(), southRoute: [NS].init())
    }
}
