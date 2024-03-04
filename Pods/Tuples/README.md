# Tuples.swift

![🐧 linux: ready](https://img.shields.io/badge/%F0%9F%90%A7%20linux-ready-red.svg)
[![GitHub license](https://img.shields.io/badge/license-Apache%202.0-lightgrey.svg)](https://raw.githubusercontent.com/tesseract-one/Tuples.swift/main/LICENSE)
[![Build Status](https://github.com/tesseract-one/Tuples.swift/workflows/Build%20%26%20Tests/badge.svg?branch=main)](https://github.com/tesseract-one/Tuples.swift/actions?query=workflow%3ABuild%20%26%20Tests+branch%3Amain)
[![GitHub release](https://img.shields.io/github/release/tesseract-one/Tuples.swift.svg)](https://github.com/tesseract-one/Tuples.swift/releases)
[![SPM compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![CocoaPods version](https://img.shields.io/cocoapods/v/Tuples.svg)](https://cocoapods.org/pods/Tuples)
![Platform OS X | iOS | tvOS | watchOS | Linux](https://img.shields.io/badge/platform-Linux%20%7C%20OS%20X%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-orange.svg)

### Generic Tuple types for Swift

## Why?

Swift doesn't support generics for tuples. They can't be properly used in the `where` clauses.

This library provides set of tuple-like structs and helper protocols to fix this.

## Getting started

### Installation

#### [Package Manager](https://swift.org/package-manager/)

Add the following dependency to your [Package.swift](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md#define-dependencies):

```swift
.package(url: "https://github.com/tesseract-one/Tuples.swift.git", from: "0.1.0")
```

Run `swift build` and build your app.

#### [CocoaPods](http://cocoapods.org/)

Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```rb
pod 'Tuples', '~> 0.1.0'
```

Then run `pod install`

### Examples

### Accept tuple as generic parameter
```swift
func accept_tuple<T>(tuple: T.STuple) where T: SomeTuple2, T.T1: StringProtocol, T.T2: UnsignedInteger {
    // tuple is (StringProtocol, UnsignedInteger)
    // tuple struct can be created
    let tupleStruct = T(tuple)
}
```

### Common constructor method
```swift
// Will create Tuple4<Int, String, Double, Array<Int>> instance
let tupleStruct = TL((1, "string", 2.0, [1, 2, 3]))
```

### Tuple from array
```swift
 // Tuple3<Int, Int, Int> returned but typed as OneTypeTuple<Int>
let tuple: OneTypeTuple<Int> = TL([1, 2, 3])
```

### Codable
Tuples can be encoded / decoded as arrays.

```swift
let json = try! JSONEncoder().encode(TL((1, "string", Data())))
let tuple = try JSONDecodder().decode(Tuple3<Int, String, Data>.self, from: json).tuple
```

### List tuples
All tuples with 1+ elements supports `ListTuple` protocol which allows to get first and last elements from the tuple and also suffix and prefix tuples without this elements.

```swift
public protocol ListTuple: SomeTuple {
    associatedtype First
    associatedtype Last
    associatedtype DroppedFirst: SomeTuple
    associatedtype DroppedLast: SomeTuple
    
    init(first: DroppedLast, last: Last)
    init(first: First, last: DroppedFirst)
    
    var first: First { get }
    var last: Last { get }
    var dropLast: DroppedLast { get }
    var dropFirst: DroppedFirst { get }
}
```

Usage examples can be found in the [Codable](./Sources/Tuples/Codable.swift) and [CustomStringConvertible](./Sources/Tuples/BaseProtocols.swift#L63C15-L63C15) implementations

## Author

 - [Tesseract Systems, Inc.](mailto:info@tesseract.one)
   ([@tesseract_one](https://twitter.com/tesseract_one))

## License

Tuples.swift is available under the Apache 2.0 license. See [the LICENSE file](./LICENSE) for more information.
