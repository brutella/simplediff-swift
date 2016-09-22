# Readme

**simplediff** is a generic implementation of the [simplediff](https://github.com/paulgb/simplediff) algorithm in Swift. It finds the difference between two lists which can be a list of characters, words or any other objects.

## Example

Lets compare 2 sentences based on the characters

```swift
let toCharacters: ((String) -> [String]) = { $0.characters.map({ "\($0)" }) }
let before = toCharacters("Swift is a programming language that builds on the best of C and Objective-C, without the constraints of C compatibility.")
let after = toCharacters("Swift is a new programming language for iOS and OS X apps that builds on the best of C and Objective-C.")
let changes = simplediff(before: before, after: after)
```

The diff looks like this

    Swift is a[+ new] programming language[+ for iOS and OS X apps] that builds on the best of C and Objective-C[-, without the constraints of C compatibility].

## Use Cases

This library makes it easy to calculate diffs of `UITableView` or `UIColletionView` data source and to animate insertions and deletions.


# Contact

Matthias Hochgatterer

Github: [https://github.com/brutella/](https://github.com/brutella/)

Twitter: [https://twitter.com/brutella](https://twitter.com/brutella)


# License

simplediff-swift is available under the MIT license. See the LICENSE file for more info.