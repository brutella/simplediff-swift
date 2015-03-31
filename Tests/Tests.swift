//
//  Tests.swift
//  Tests
//
//  Created by Matthias Hochgatterer on 31/03/15.
//  Copyright (c) 2015 Matthias Hochgatterer. All rights reserved.
//

import Cocoa
import XCTest

class Tests: XCTestCase {
    func testCharactersimplediff() {
        let result = simplediff([Character]("Matthias"), [Character]("Matthew"))
        XCTAssertEqual(result.count, 3)
        XCTAssertEqual(result[0].type, .Noop)
        XCTAssertEqual(result[0].elements, [Character]("Matth"))
        XCTAssertEqual(result[1].type, .Delete)
        XCTAssertEqual(result[1].elements, [Character]("ias"))
        XCTAssertEqual(result[2].type, .Insert)
        XCTAssertEqual(result[2].elements, [Character]("ew"))
    }
    
    func testWordssimplediff() {
        let before = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.".componentsSeparatedByString(" ")
        let after = "Lorem ipsum dolor amet, consectetur sit amet elit.".componentsSeparatedByString(" ")
        let result = simplediff(before, after)
        XCTAssertEqual(result.count, 6)
        XCTAssertEqual(result[0].type, .Noop)
        XCTAssertEqual(result[0].elements, "Lorem ipsum dolor".componentsSeparatedByString(" "))
        XCTAssertEqual(result[1].type, .Delete)
        XCTAssertEqual(result[1].elements, ["sit"])
        XCTAssertEqual(result[2].type, .Noop)
        XCTAssertEqual(result[2].elements, "amet, consectetur".componentsSeparatedByString(" "))
        XCTAssertEqual(result[3].type, .Delete)
        XCTAssertEqual(result[3].elements, ["adipiscing"])
        XCTAssertEqual(result[4].type, .Insert)
        XCTAssertEqual(result[4].elements, "sit amet".componentsSeparatedByString(" "))
        XCTAssertEqual(result[5].type, .Noop)
        XCTAssertEqual(result[5].elements, ["elit."])
    }
    
    func testNumbers() {
        let result = simplediff([1, 4, 10], [1, 2, 3, 4, 5])
        XCTAssertEqual(result.count, 5)
        XCTAssertEqual(result[0].type, .Noop)
        XCTAssertEqual(result[0].elements, [1])
        XCTAssertEqual(result[1].type, .Insert)
        XCTAssertEqual(result[1].elements, [2, 3])
        XCTAssertEqual(result[2].type, .Noop)
        XCTAssertEqual(result[2].elements, [4])
        XCTAssertEqual(result[3].type, .Delete)
        XCTAssertEqual(result[3].elements, [10])
        XCTAssertEqual(result[4].type, .Insert)
        XCTAssertEqual(result[4].elements, [5])
    }
}
