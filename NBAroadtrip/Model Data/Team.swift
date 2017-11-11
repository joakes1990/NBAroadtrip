//
//  Team.swift
//  NBAroadtrip
//
//  Created by Justin Oakes on 10/11/17.
//  Copyright © 2017 Oklasoft. All rights reserved.
//

import Foundation

struct League: Codable {
    let description: String
    let teams: [Team]
    
    enum CodingKeys : String, CodingKey {
        case description
        case teams = "nba_teams"
    }

}

struct Team: Codable {
    let conference: Conference
    let division: Division
    let name: String
    let city: String
    let state: String?
    let stadium: String
}

enum Conference: String, Codable {
    typealias RawValue = String
    
    case eastern = "Eastern"
    case western = "Western"
}

enum Division: String, Codable {
    typealias RawValue = String
    
    case atlantic = "Atlantic"
    case central = "Central"
    case southeast = "Southeast"
    case northwest = "Northwest"
    case pacific = "Pacific"
    case southwest = "Southwest"
}

