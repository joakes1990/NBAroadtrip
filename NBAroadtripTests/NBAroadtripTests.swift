//
//  NBAroadtripTests.swift
//  NBAroadtripTests
//
//  Created by Justin Oakes on 10/11/17.
//  Copyright © 2017 Oklasoft. All rights reserved.
//

import XCTest
@testable import NBAroadtrip

class NBAroadtripTests: XCTestCase, TeamManagementProtocol {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTeams() {
        let manager = TeamManagement()
        let teams = manager.teams
        print(teams)
    }
    
    func didUpdateTeams(teams: [Team]) {
        print(teams)
        XCTAssert(true)
    }
    
    func failedUpdate(errorText: String) {
        print(errorText)
    }
}
