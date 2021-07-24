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
    var rowBackgroundColor = Color(red: 97/255, green: 110/255, blue: 124/255, opacity: 1.0)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                rowBackgroundColor.cornerRadius(5)
                Text(stationName).foregroundColor(.white).font(.custom("AvenirNext-Regular", size: 20))
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
