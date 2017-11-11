//
//  TeamManagment.swift
//  NBAroadtrip
//
//  Created by Justin Oakes on 10/11/17.
//  Copyright © 2017 Oklasoft. All rights reserved.
//

import Foundation

class TeamManagement {
    
    var delegate: TeamManagementProtocol?
    
    init() {

        unowned let unownedSelf: TeamManagement = self
        URLSession.shared.dataTask(with: URL.teamsURL) { (data, responce, error) in
            if let foundError: Error = error {
                unownedSelf.delegate?.failedUpdate(errorText: foundError.localizedDescription)
                return
            }
            guard let jsonData: Data = data else {
                unownedSelf.delegate?.failedUpdate(errorText: "malformed data")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let league: League = try decoder.decode(League.self, from: jsonData)
                unownedSelf.delegate?.didUpdateTeams(teams: league.teams)
            } catch {
                unownedSelf.delegate?.failedUpdate(errorText: error.localizedDescription)
                return
            }
        }.resume()
    }
    
}

protocol TeamManagementProtocol {
    func didUpdateTeams(teams: [Team])
    func failedUpdate(errorText: String)
}

