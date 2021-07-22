//
//  API.swift
//  API
//
//  Created by Nicholas Repaci on 7/20/21.
//

import Foundation
import SwiftUI


struct GTFSObject: Codable {
    let data: [TrainResponse]
    let updated: String
}

struct TrainResponse: Codable {
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

struct NS: Codable {
    let route: String?
    let time: String?
}

class API: ObservableObject {
    
    @Published var data: TrainResponse?
    @Published var updated = String()
    
    func loadData() {
        guard let url = URL(string: "http://127.0.0.1:5000/by-route/A") else {
            print("Your API end point is Invalid")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(GTFSObject.self, from: data) {
                    //print("\n-------> response: \(response)\n")
                    DispatchQueue.main.async {
                        if let data = response.data.first {
                            self.data = data
                            self.updated = response.updated
                        
                        }
                        return
                    }
                }
            }
        }.resume()
    }
}

//struct Main: Codable {
//    let data: [Datum]
//    let updated: String
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let n, s: [N]
//    let id: String
//    let lastUpdate: Date
//    let location: [Double]
//    let name: String
//    let routes: [String]
//    let stops: [String: [Double]]
//
//    enum CodingKeys: String, CodingKey {
//        case n = "N"
//        case s = "S"
//        case id
//        case lastUpdate = "last_update"
//        case location, name, routes, stops
//    }
//}
//
//// MARK: - N
//struct N: Codable {
//    let route: String
//    let time: Date
//}
//
//class API: ObservableObject {
//
//    @Published var data: Datum?
//    @Published var updated = String()
//
//    @Published var storedData = [String: String?]()
//    //@Published var testN =
//    //@Published whatever =
//    @Published var testRoute = String()
//
//    @Published var ns = N.self
//    @Published var id = String()
//    @Published var lastUpdate = Date()
//    @Published var location = [Double]()
//    @Published var name = String()
//    @Published var routes = [String]()
//    @Published var stops = [String: [Double]]()
//
//    func loadData() {
//        guard let url = URL(string: "http://127.0.0.1:5000/by-route/A") else {
//            print("Your API end point is Invalid")
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try? JSONDecoder().decode(Main.self, from: data) {
//                    DispatchQueue.main.async {
//                        if let data = response.data.first {
//                            self.data = data
//                            self.updated = response.updated
//
////                            self.routes = response.routes
////                            self.id = response.id
////                            self.lastUpdate = response.lastUpdate
////                            self.location = response.location
////                            self.name = response.name
////                            self.routes = response.routes
////                            self.stops = response.stops
//                        }
//                    }
//                    return
//                }
//            }
//        }.resume()
//    }
//}


//struct MealResponse: Codable {
//    var meals: [[String: String?]]
//}
//
//class API: ObservableObject {
//
//    @Published var meals = [[String: String?]]()
//    @Published var firstMeal = [String: String?]()
//    @Published var mealName = String()
//    @Published var mealInstructions = String()
//
//    func loadData() {
//        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else {
//            print("Your API end point is Invalid")
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try? JSONDecoder().decode(MealResponse.self, from: data) {
//                    DispatchQueue.main.async {
//                        if let firstOne = response.meals.first {
//                            self.meals = response.meals
//                            self.firstMeal = firstOne
//                            self.mealName = (self.firstMeal["strMeal"] ?? "") ?? ""
//                            self.mealInstructions = (self.firstMeal["strInstructions"] ?? "") ?? ""


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




//
//struct TrainResponse: Codable {
//    let data: [[String: String?]]
//    let n, s: [NS]
//    let id: String
//    let lastUpdate: Date
//    let location: [Double]
//    let name: String
//    let routes: [String]
//    let stops: [String: [Double]]
//
//    enum CodingKeys: String, CodingKey {
//        case data
//        case n = "N"
//        case s = "S"
//        case id
//        case lastUpdate = "last_update"
//        case location, name, routes, stops
//    }
//}
//
//// MARK: - N
//struct NS: Codable {
//    let route: String
//    let time: Date
//}


//class API: ObservableObject {
//
//    @Published var data = [Datum]()
//
//    @Published var storedData = [String: String?]()
//    //@Published var testN =
//    //@Published whatever =
//    @Published var testRoute = String()
//
//    @Published var ns = N.self
//    @Published var id = String()
//    @Published var lastUpdate = Date()
//    @Published var location = [Double]()
//    @Published var name = String()
//    @Published var routes = [String]()
//    @Published var stops = [String: [Double]]()
//
//    func loadData() {
//        guard let url = URL(string: "http://127.0.0.1:5000/by-route/A") else {
//            print("Your API end point is Invalid")
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let data = data {
//                if let response = try? JSONDecoder().decode(TrainResponse.self, from: data) {
//                    DispatchQueue.main.async {
//                        if let data = response.data.first {
//                            self.storedData = data.self
//
//                            self.routes = response.routes
//                            self.id = response.id
//                            self.lastUpdate = response.lastUpdate
//                            self.location = response.location
//                            self.name = response.name
//                            self.routes = response.routes
//                            self.stops = response.stops
//                        }
//                    }
//                    return
//                }
//            }
//        }.resume()
//    }
