# xxHash
![🐧 linux: ready](https://img.shields.io/badge/%F0%9F%90%A7%20linux-ready-red.svg)
[![GitHub license](https://img.shields.io/badge/license-Apache%202.0-lightgrey.svg)](https://raw.githubusercontent.com/tesseract-one/xxHash.swift/main/LICENSE)
[![Build Status](https://github.com/tesseract-one/xxHash.swift/workflows/Build%20%26%20Tests/badge.svg?branch=main)](https://github.com/tesseract-one/xxHash.swift/actions?query=workflow%3ABuild%20%26%20Tests+branch%3Amain)
[![GitHub release](https://img.shields.io/github/release/tesseract-one/xxHash.swift.svg)](https://github.com/tesseract-one/xxHash.swift/releases)
[![SPM compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![CocoaPods version](https://img.shields.io/cocoapods/v/xxHash.svg)](https://cocoapods.org/pods/xxHash)
![Platform OS X | iOS | tvOS | watchOS | Linux](https://img.shields.io/badge/platform-Linux%20%7C%20OS%20X%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-orange.svg)

### Swift wrapper for [xxHash C library](https://github.com/Cyan4973/xxHash)

Wrapped:
* xxHash32
* xxHash64
* xxHash3 64bit (class xxHash3)
* xxHash3 128bit (class xxHash128)

## Getting started

### Installation

#### [Package Manager](https://swift.org/package-manager/)

Add the following dependency to your [Package.swift](https://github.com/apple/swift-package-manager/blob/master/Documentation/Usage.md#define-dependencies):

```swift
.package(url: "https://github.com/tesseract-one/xxHash.swift.git", from: "0.1.0")
```

Run `swift build` and build your app.

#### [CocoaPods](http://cocoapods.org/)

Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

```rb
pod 'xxHash', '~> 0.1.0'
```

Then run `pod install`

### Examples

### One Shot methods
```swift
import xxHash

let hash64 = xxHash64.hash("UTF8 string")
let hash32 = xxHash32.hash([1, 255, 127, 0], seed: 1234)
let hash3_64 = xxHash3.hash(Data())
let hash3_128 = xxHash128.hash(Data(), seed: 1234, secret: Data(repeating: 0xff, count: 32))
```

### Streaming api
```swift
import xxHash

var hasher = try xxHash64(seed: 1234) // or xxHash64() for empty seed
try hasher.update("Some string") // string
try hasher.update([1, 2, 255, 127]) // byte array
try hasher.update(Data(repeating: 0xff, count: 32)) // data
let hash = hasher.digest()
```

### Helper methods
```swift
import xxHash

// Canonical form of hash (BE bytes array)
let intHash = xxHash64.hash("UTF8 string")
let hashBytes = xxHash64.canonical(hash: intHash)
let restored = try xxHash64.hash(canonical: hashBytes)
assert(intHash == restored)

// Secret generation for xxHash3
let secret1 = xxHash3.generateSecret(seed: 12345678) // from UInt64
let secret2 = try xxHash3.generateSecret(seed: Data(repeating: 0xff, count: 32)) // from seed data
let secret3 = try xxHash3.generateSecret(seed: "Some string") // from seed string
let secret4 = try xxHash3.generateSecret(seed: [1, 255, 254, 127]) // from byte array
```

## Author

 - [Tesseract Systems, Inc.](mailto:info@tesseract.one)
   ([@tesseract_one](https://twitter.com/tesseract_one))

## License

xxHash.swift is available under the Apache 2.0 license. See [the LICENSE file](./LICENSE) for more information.
