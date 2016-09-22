//
//  main.swift
//  simplediff
//
//  Created by Matthias Hochgatterer on 31/03/15.
//  Copyright (c) 2015 Matthias Hochgatterer. All rights reserved.
//

import Foundation

let toCharacters: ((String) -> [String]) = { $0.characters.map({ "\($0)" }) }
let before = toCharacters("Swift is a programming language that builds on the best of C and Objective-C, without the constraints of C compatibility.")
let after = toCharacters("Swift is a new programming language for iOS and OS X apps that builds on the best of C and Objective-C.")
let changes = simplediff(before: before, after: after)
for change in changes {
    print(change.description, terminator: "")
}
