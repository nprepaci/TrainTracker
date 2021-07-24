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

       var body: some View {
           ZStack {
               Color(red: 66/255, green: 66/255, blue: 66/255, opacity: 1.0).cornerRadius(12)
               Text(stationName).foregroundColor(.white).font(.custom("AvenirNext-Regular", size: 20))
           }
           .fixedSize(horizontal: false, vertical: true)
           .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
       }
}

//struct ListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRow(stationName: .constant(String.init()))
//    }
//}
