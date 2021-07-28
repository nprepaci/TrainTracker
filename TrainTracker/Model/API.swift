//
//  API.swift
//  API
//
//  Created by Nicholas Repaci on 7/20/21.
//

import Foundation
import SwiftUI

struct GTFSObject: Codable {
    var data: [TrainResponse]
    let updated: String?
}

struct TrainResponse: Codable, Identifiable {
    let n, s: [NS]?
    let id: String?
    let lastUpdate: String?
    let location: [Double]?
    let name: String?
    let routes: [String]?
    let stops: [String: [Double]]?
    
    enum CodingKeys: String, CodingKey {
        case n = "N"
        case s = "S"
        case id
        case lastUpdate = "last_update"
        case location, name, routes, stops
    }
}

struct NS: Codable, Hashable {
    var route: String?
    let time: String?
}

class SelectedStation: ObservableObject {
    @Published var selectedStation: String = "A"
    public static let shared = SelectedStation()
}

class API: ObservableObject {
    
    var chosenStation = SelectedStation.shared
    @Published var storedData = GTFSObject(data: [], updated: nil)
    
    func loadData() {
        guard let url = URL(string: "http://127.0.0.1:5000/by-route/\(chosenStation.selectedStation)") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(GTFSObject.self, from: data) {
                    // print("\n-------> response: \(response)\n")
                    DispatchQueue.main.async {
                        self.storedData.data = response.data
                    }
                    return
                }
            }
        }.resume()
    }
}
