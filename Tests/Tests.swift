//
//  Tests.swift
//  Tests
//
//  Created by Matthias Hochgatterer on 31/03/15.
//  Copyright (c) 2015 Matthias Hochgatterer. All rights reserved.
//

import Swift
import XCTest

class Tests: XCTestCase {
    func testCharacterdiff() {
        let toCharacters: ((String) -> [String]) = { $0.characters.map({ "\($0)" }) }        
        let result = simplediff(before: toCharacters("Matthias"), after: toCharacters("Matthew"))
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0].type, .noop)
        XCTAssertEqual(result[0].elements, toCharacters("Matth"))
        XCTAssertEqual(result[1].type, .delete)
        XCTAssertEqual(result[1].elements, toCharacters("ias"))
        XCTAssertEqual(result[2].type, .insert)
        XCTAssertEqual(result[2].elements, toCharacters("ew"))
    }
    
    func testWordsdiff() {
        let before = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.".components(separatedBy: " ")
        let after = "Lorem ipsum dolor amet, consectetur sit amet elit.".components(separatedBy: " ")
        let result = simplediff(before: before, after: after)
        XCTAssertEqual(result.count, 6)
        XCTAssertEqual(result[0].type, .noop)
        XCTAssertEqual(result[0].elements, "Lorem ipsum dolor".components(separatedBy: " "))
        XCTAssertEqual(result[1].type, .delete)
        XCTAssertEqual(result[1].elements, ["sit"])
        XCTAssertEqual(result[2].type, .noop)
        XCTAssertEqual(result[2].elements, "amet, consectetur".components(separatedBy: " "))
        XCTAssertEqual(result[3].type, .delete)
        XCTAssertEqual(result[3].elements, ["adipiscing"])
        XCTAssertEqual(result[4].type, .insert)
        XCTAssertEqual(result[4].elements, "sit amet".components(separatedBy: " "))
        XCTAssertEqual(result[5].type, .noop)
        XCTAssertEqual(result[5].elements, ["elit."])
    }
    
    func testNumbers() {
        let result = simplediff(before: [1, 4, 10], after: [1, 2, 3, 4, 5])
        XCTAssertEqual(result.count, 5)
        XCTAssertEqual(result[0].type, .noop)
        XCTAssertEqual(result[0].elements, [1])
        XCTAssertEqual(result[1].type, .insert)
        XCTAssertEqual(result[1].elements, [2, 3])
        XCTAssertEqual(result[2].type, .noop)
        XCTAssertEqual(result[2].elements, [4])
        XCTAssertEqual(result[3].type, .delete)
        XCTAssertEqual(result[3].elements, [10])
        XCTAssertEqual(result[4].type, .insert)
        XCTAssertEqual(result[4].elements, [5])
    }
}
