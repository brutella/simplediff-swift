//
//  simplediff.swift
//  simplediff
//
//  Created by Matthias Hochgatterer on 31/03/15.
//  Copyright (c) 2015 Matthias Hochgatterer. All rights reserved.
//

import Foundation

enum OperationType {
    case Insert, Delete, Noop
    
    var description: String {
        get {
            switch self {
            case .Insert: return "+"
            case .Delete: return "-"
            case .Noop: return "="
            }
        }
    }
}

/// Operation describes an operation (insertion, deletion, or noop) of elements.
struct Operation<T> {
    let type: OperationType
    let elements: [T]
    
    var elementsString: String {
        return "".join(elements.map { "\($0)" })
    }
    
    var description: String {
        get {
            switch type {
            case .Insert:
                return "[+\(elementsString)]"
            case .Delete:
                return "[-\(elementsString)]"
            default:
                return "\(elementsString)"
            }
        }
    }
}

/// diff finds the difference between two lists.
/// This algorithm a shameless copy of simplediff https://github.com/paulgb/simplediff
///
/// :param: before Old list of elements.
/// :param: after New list of elements
/// :returns: A list of operation (insert, delete, noop) to transform the list *before* to the list *after*.
func simplediff<T where T: Equatable, T: Hashable>(before: [T], after: [T]) -> [Operation<T>] {
    // Create map of indices for every element
    var beforeIndices = [T: [Int]]()
    for (index, elem) in enumerate(before) {
        var indices = beforeIndices.indexForKey(elem) != nil ? beforeIndices[elem]! : [Int]()
        indices.append(index)
        beforeIndices[elem] = indices
    }
    
    var beforeStart = 0
    var afterStart = 0
    var maxOverlayLength = 0
    var overlay = [Int: Int]() // remembers *overlayLength* of previous element
    for (index, elem) in enumerate(after) {
        var _overlay = [Int: Int]()
         // Element must be in *before* list
        if let elemIndices = beforeIndices[elem] {
            // Iterate over element indices in *before*
            for elemIndex in elemIndices {
                var overlayLength = 1
                if let previousSub = overlay[elemIndex - 1] {
                    overlayLength += previousSub
                }
                _overlay[elemIndex] = overlayLength
                if overlayLength > maxOverlayLength { // longest overlay?
                    maxOverlayLength = overlayLength
                    beforeStart = elemIndex - overlayLength + 1
                    afterStart = index - overlayLength + 1
                }
            }
        }
        overlay = _overlay
    }
    
    var operations = [Operation<T>]()
    if maxOverlayLength == 0 {
         // No overlay; remove before and add after elements
        if before.count > 0 {
            operations.append(Operation(type: .Delete, elements: before))
        }
        if after.count > 0 {
            operations.append(Operation(type: .Insert, elements: after))
        }
    } else {
        // Recursive call with elements before overlay
        operations += simplediff(Array(before[0..<beforeStart]), Array(after[0..<afterStart]))
        // Noop for longest overlay
        operations.append(Operation(type: .Noop, elements: Array(after[afterStart..<afterStart+maxOverlayLength])))
        // Recursive call with elements after overlay
        operations += simplediff(Array(before[beforeStart+maxOverlayLength..<before.count]), Array(after[afterStart+maxOverlayLength..<after.count]))
    }
    return operations
}
