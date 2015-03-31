//
//  main.swift
//  simplediff
//
//  Created by Matthias Hochgatterer on 31/03/15.
//  Copyright (c) 2015 Matthias Hochgatterer. All rights reserved.
//

import Foundation

let before = [Character]("Swift is a programming language that builds on the best of C and Objective-C, without the constraints of C compatibility.")
let after = [Character]("Swift is a new programming language for iOS and OS X apps that builds on the best of C and Objective-C.")
let result = simplediff(before, after)
for r in result {
    print(r.description)
}