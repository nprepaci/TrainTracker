//
//  API.swift
//  API
//
//  Created by Nicholas Repaci on 7/20/21.
//

import SwiftUI

import Foundation
import SwiftUI

struct MealResponse: Codable {
    var meals: [[String: String?]]
}

//struct Result: Codable {
//    let arrivals: [String]
//    let lat, lon, name: String
//}

struct TrainResponse: Codable {
    let n, s: [N]
    let id: String
    let lastUpdate: Date
    let location: [Double]
    let name: String
    let routes: [String]
    let stops: [String: [Double]]

    enum CodingKeys: String, CodingKey {
        case n = "N"
        case s = "S"
        case id
        case lastUpdate = "last_update"
        case location, name, routes, stops
    }
}

// MARK: - N
struct N: Codable {
    let route: String
    let time: Date
}

class API: ObservableObject {
    
    @Published var arrivals = [String]()
    @Published var lat = String()
    @Published var lon = String()
    @Published var name = String()
    
    func loadData() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(TrainResponse.self, from: data) {
                    DispatchQueue.main.async {
                        if let firstOne = response.meals.first {
                            self.meals = response.meals
                            self.firstMeal = firstOne
                            self.mealName = (self.firstMeal["strMeal"] ?? "") ?? ""
                            self.mealInstructions = (self.firstMeal["strInstructions"] ?? "") ?? ""
                        }
                    }
                    return
                }
            }
        }.resume()
    }
}



//Sample Data:

//{
//            "N": [
//                {
//                    "route": "A",
//                    "time": "2021-07-21T00:18:01-04:00"
//                },
//                {
//                    "route": "A",
//                    "time": "2021-07-21T00:28:01-04:00"
//                },
//                {
//                    "route": "A",
//                    "time": "2021-07-21T00:38:13-04:00"
//                }
//            ],
//            "S": [
//                {
//                    "route": "A",
//                    "time": "2021-07-21T00:22:01-04:00"
//                },
//                {
//                    "route": "A",
//                    "time": "2021-07-21T00:31:31-04:00"
//                }
//            ],
//            "id": "bed9",
//            "last_update": "2021-07-21T00:15:39-04:00",
//            "location": [
//                40.796092,
//                -73.961454
//            ],
//            "name": "103 St",
//            "routes": [
//                "A"
//            ],
//            "stops": {
//                "A18": [
//                    40.796092,
//                    -73.961454
//                ]
//            }
//        },
