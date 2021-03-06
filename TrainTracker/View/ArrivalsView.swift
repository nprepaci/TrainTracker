//
//  ArrivalsView.swift
//  ArrivalsView
//
//  Created by Nicholas Repaci on 7/23/21.
//

import SwiftUI

struct ArrivalsView: View {
    
    @StateObject var api = API()
    @State var timerRefreshCount = 0
    var stationName: String
    var northRoute: [NS]
    var southRoute: [NS]
    var backgroundColor = Color(red: 29/255, green: 32/255, blue: 37/255, opacity: 1.0)
    let timer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    var changeColor = ChangeColor.shared
    
    var body: some View {
        ZStack {
            Color(red: changeColor.backgroundRed/255, green: changeColor.backgroundGreen/255, blue: changeColor.backgroundBlue/255, opacity: 1.0).edgesIgnoringSafeArea(.all)
            ScrollView {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        ForEach(northRoute, id: \.self) { index in
                            HStack {
                                Image(systemName: "arrow.up.circle").foregroundColor(Color(red: changeColor.arrowRed/255, green: changeColor.arrowGreen/255, blue: changeColor.arrowBlue/255, opacity: 1.0)).font(.system(size: 27))
                                
                                Image(index.route ?? "").resizable().frame(width: 30, height: 30)
                                
                                let timeDifference = calculateTimeDifference(arrivalTime: index.time ?? "")
                                Text(timeDifference ?? "").foregroundColor(Color(red: changeColor.generalTextRed/255, green: changeColor.generalTextGreen/255, blue: changeColor.generalTextBlue/255, opacity: 1.0)).font(.system(size: 25)).fontWeight(.thin)
                            }
                            .padding(.bottom, 50)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        ForEach(southRoute, id: \.self) { index in
                            HStack {
                                Image(systemName: "arrow.down.circle").foregroundColor(Color(red: changeColor.arrowRed/255, green: changeColor.arrowGreen/255, blue: changeColor.arrowBlue/255, opacity: 1.0)).font(.system(size: 27))
                                
                                Image(index.route ?? "").resizable().frame(width: 30, height: 30)
                                
                                let timeDifference = calculateTimeDifference(arrivalTime: index.time ?? "")
                                Text(timeDifference ?? "").foregroundColor(Color(red: changeColor.generalTextRed/255, green: changeColor.generalTextGreen/255, blue: changeColor.generalTextBlue/255, opacity: 1.0)).font(.system(size: 25)).fontWeight(.thin)
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
                            Image(systemName: "arrow.up.circle").foregroundColor(Color(red: changeColor.arrowRed/255, green: changeColor.arrowGreen/255, blue: changeColor.arrowBlue/255, opacity: 1.0))
                            Text("Uptown").fontWeight(.thin).foregroundColor(Color(red: changeColor.generalTextRed/255, green: changeColor.generalTextGreen/255, blue: changeColor.generalTextBlue/255, opacity: 1.0))
                            Image(systemName: "arrow.down.circle").foregroundColor(Color(red: changeColor.arrowRed/255, green: changeColor.arrowGreen/255, blue: changeColor.arrowBlue/255, opacity: 1.0))
                            Text("Downtown").fontWeight(.thin).foregroundColor(Color(red: changeColor.generalTextRed/255, green: changeColor.generalTextGreen/255, blue: changeColor.generalTextBlue/255, opacity: 1.0))
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
      //assigns dateformatter to a variable
        let RFC3339DateFormatter = DateFormatter()
        //assings to english locale
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        //specifies date format
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
      //specifies timezone offset
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
      //get arrival time from API and assigns it to a variable
        let trainArrivalTime = arrivalTime
      //converts date into format that a calculation can be performed with
        let date2 = RFC3339DateFormatter.date(from: trainArrivalTime ?? "")
        var timeDifference = ""
        
        if let d2 = date2 {
          //sends current date time to calculation (func timeDiff) to get minuets adn then assigns to variable for display to user
            let (minutes) = timeDiff(d2)
            timeDifference = "\(minutes) min"
        }
        return timeDifference
    }
    
    func timeDiff(_ t2: Date) -> (Int) {
        
      //current date
        let date = Date()
        let calendar = Calendar.current
      //gets current time in minuets
        let minutes = calendar.component(.minute, from: date)
      //gets current time in minuets for time passed in by API
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
