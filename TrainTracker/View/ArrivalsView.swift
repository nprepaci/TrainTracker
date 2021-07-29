//
//  ArrivalsView.swift
//  ArrivalsView
//
//  Created by Nicholas Repaci on 7/23/21.
//

import SwiftUI

struct ArrivalsView: View {
    
    @StateObject var api = API()
    var stationName: String
    var northRoute: [NS]
    var southRoute: [NS]
    var backgroundColor = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    //var timeColor = Color(red: 29/255, green: 222/255, blue: 203/255, opacity: 1.0)
    //var textColor = Color(red: 185/255, green: 239/255, blue: 165/255, opacity: 1.0)
    let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    @State var timerRefreshCount = 0
    var changeColor = ChangeColor.shared
    
    
    var body: some View {
        ZStack {
            Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0).edgesIgnoringSafeArea(.all)
            ScrollView {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        ForEach(northRoute, id: \.self) { index in
                            HStack {
                                Image(systemName: "arrow.up.circle").foregroundColor(.white).font(.system(size: 25))
                                Text(index.route ?? "").foregroundColor(Color(red: changeColor.generalTextRed/255, green: changeColor.generalTextGreen/255, blue: changeColor.generalTextBlue/255, opacity: 1.0)).font(.system(size: 25))
                                let timeDifference = calculateTimeDifference(arrivalTime: index.time ?? "")
                                Text(timeDifference ?? "").foregroundColor(Color(red: changeColor.navButtonsRed/255, green: changeColor.navButtonsGreen/255, blue: changeColor.navButtonsBlue/255, opacity: 1.0)).font(.system(size: 25)).fontWeight(.thin)
                            }
                            .padding(.bottom, 50)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        ForEach(southRoute, id: \.self) { index in
                            HStack {
                                Image(systemName: "arrow.down.circle").foregroundColor(.white).font(.system(size: 25))
                                Text(index.route ?? "").foregroundColor(Color(red: changeColor.generalTextRed/255, green: changeColor.generalTextGreen/255, blue: changeColor.generalTextBlue/255, opacity: 1.0)).font(.system(size: 25))
                                let timeDifference = calculateTimeDifference(arrivalTime: index.time ?? "")
                                Text(timeDifference ?? "").foregroundColor(Color(red: changeColor.navButtonsRed/255, green: changeColor.navButtonsGreen/255, blue: changeColor.navButtonsBlue/255, opacity: 1.0)).font(.system(size: 25)).fontWeight(.thin)
                            }
                            .padding(.bottom, 50)
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                .navigationBarTitle(stationName, displayMode: .inline)
                VStack {
                    Spacer()
                    Text("Updated \(timerRefreshCount) seconds ago").foregroundColor(.white).fontWeight(.thin).opacity(0.5)
                }
            }
            //API called every minute, updates what is displayed to user
            .onReceive(timer) { time in
                updateTimeSinceRefresh()
            }
            .animation(.spring().speed(0.75))
            .padding(.top)
            Spacer()
            //this section handles the divider, legend, and fill behind the legend
            GeometryReader { geometry in
                ZStack {
                    VStack {
                        Spacer()
                        Rectangle().fill( Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0)).frame(width: geometry.size.width, height: 60).edgesIgnoringSafeArea(.bottom)
                    }.edgesIgnoringSafeArea(.bottom)
                    VStack {
                        Spacer()
                        Divider().foregroundColor(.white)
                        HStack {
                            Image(systemName: "arrow.up.circle").foregroundColor(.white)
                            Text("Uptown").fontWeight(.thin)
                            Image(systemName: "arrow.down.circle").foregroundColor(.white)
                            Text("Downtown").fontWeight(.thin)
                        }.zIndex(20)
                    }
                    Spacer()
                }
            }
            
        }
    }
    
    func updateTimeSinceRefresh() {
        if (timerRefreshCount == 0) {
            timerRefreshCount = 15
        } else if (timerRefreshCount == 15) {
            timerRefreshCount = 30
        } else if (timerRefreshCount == 30) {
            timerRefreshCount = 45
        } else if (timerRefreshCount == 45) {
            timerRefreshCount = 0
            api.loadData()
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
