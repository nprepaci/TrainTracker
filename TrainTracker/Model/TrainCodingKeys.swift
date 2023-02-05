//
//  TrainCodingKeys.swift
//  TrainTracker
//
//  Created by Nicholas Repaci on 2/4/23.
//

import Foundation

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
