# Readme

**simplediff** is an implementation of the [simplediff](https://github.com/paulgb/simplediff) in Swift. It finds the difference between two lists which can be a list of characters, words or any other objects.

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
let diffs = simplediff([Character](sentenceBefore), [Character](sentenceAfter))
```

The diffs looks like this

    Swift is a[+ new] programming language[+ for iOS and OS X apps] that builds on the best of C and Objective-C[-, without the constraints of C compatibility].