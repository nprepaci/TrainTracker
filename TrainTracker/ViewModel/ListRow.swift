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
    @State var changeColor = ChangeColor.shared
    
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
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(stationName: String.init())
    }
}
