//
//  ListRow.swift
//  ListRow
//
//  Created by Nicholas Repaci on 7/23/21.
//

import Foundation
import SwiftUI

struct ListRow: View {
    
    @State var stationName: String
    //var rowBackgroundColor = Color(red: 97/255, green: 110/255, blue: 124/255, opacity: 1.0)
    //var rowBackgroundColor = Color(red: 54/255, green: 77/255, blue: 97/255, opacity: 1.0)
    var rowBackgroundColor = Color(red: 46/255, green: 68/255, blue: 90/255, opacity: 1.0)
    //var textColor = Color(red: 29/255, green: 222/255, blue: 203/255, opacity: 1.0)
    var changeColor = ChangeColor.shared
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: changeColor.rowBackgroundRed/255, green: changeColor.rowBackgroundGreen/255, blue: changeColor.rowBackgroundBlue/255, opacity: 1.0).cornerRadius(5)
                Text(stationName).foregroundColor(.white).font(.system(size: 25)).fontWeight(.thin)
                    .frame(width: geometry.size.width, height: 40, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
                    .padding(.leading)
            }
            //.fixedSize(horizontal: false, vertical: true)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(stationName: String.init())
    }
}
