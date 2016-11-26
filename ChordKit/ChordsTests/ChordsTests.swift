//
//  ChordsTests.swift
//  ChordsTests
//
//  Created by Carsten Könemann on 26/11/2016.
//  Copyright © 2016 cargath. All rights reserved.
//

import XCTest
@testable import Chords

class ChordsTests: XCTestCase {

    var defaults: [ChordTableViewSection]?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        defaults = ChordTableViewSection.from(JSONArrayNamed: "Defaults")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        print(defaults as Any)
    }
    
}
