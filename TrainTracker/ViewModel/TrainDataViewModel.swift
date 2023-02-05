//
//  TrainDataViewModel.swift
//  TrainDataViewModel
//
//  Created by Nicholas Repaci on 7/20/21.
//

import Foundation
import SwiftUI

struct NS: Codable, Hashable {
    var route: String?
    let time: String?
}

class TrainDataViewModel: ObservableObject {
    
    @Published var storedData = GTFSObject(data: [], updated: nil)

    func loadData(selectedStation: String) {
        // Enter your local server address below. Please be sure not to change anything after and including "/by-route"
        guard let url = URL(string: "http://127.0.0.1:5000/by-route/\(selectedStation)") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(GTFSObject.self, from: data) {
                    DispatchQueue.main.async {
                        self.storedData.data = response.data
                    }
                    return
                }
            }
        }
        .resume()
    }
}
