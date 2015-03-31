# Readme

**simplediff** is an implementation of the [simplediff](https://github.com/paulgb/simplediff) algorithm in Swift. It finds the difference between two lists which can be a list of characters, words or any other objects.

## Example

Lets compare the sentence

```swift
let sentenceBefore = "Swift is a programming language that builds on the best of C and Objective-C, without the constraints of C compatibility."
```

with

```swift
let sentenceAfter = "Swift is a new programming language for iOS and OS X apps that builds on the best of C and Objective-C."
```

We convert the strings into a list of characters and call the method `simplediff`

```swift
let operations = diff([Character](sentenceBefore), [Character](sentenceAfter))
```

The operations printed as strings looks like this

    Swift is a[+ new] programming language[+ for iOS and OS X apps] that builds on the best of C and Objective-C[-, without the constraints of C compatibility].

## Use Cases

This library makes it easy to calculate diffs of `UITableView` or `UIColletionView` data source and to animate insertions and deletions.


# Contact

Matthias Hochgatterer

Github: [https://github.com/brutella/](https://github.com/brutella/)

Twitter: [https://twitter.com/brutella](https://twitter.com/brutella)


# License

simplediff-swift is available under the MIT license. See the LICENSE file for more info.