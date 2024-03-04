//
//  Codable.swift
//  
//
//  Created by Yehor Popovych on 05/07/2023.
//

import Foundation

public extension DecodableTuple {
    @inlinable
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        try self.init(paramsFrom: &container)
        if !container.isAtEnd {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription:
                    "Container has more elements than needed for Tuple\(Self.count)"
            )
        }
    }
}

public extension EncodableTuple {
    @inlinable
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try encode(paramsTo: &container)
    }
}

public extension DecodableTuple where
    Self: ListTuple, Self.DroppedLast: DecodableTuple, Self.Last: Decodable
{
    @inlinable
    init(paramsFrom container: inout UnkeyedDecodingContainer) throws {
        let prev = try DroppedLast(paramsFrom: &container)
        let last = try container.decode(Last.self)
        self.init(first: prev, last: last)
    }
}

public extension EncodableTuple where
    Self: ListTuple, Self.DroppedLast: EncodableTuple, Self.Last: Encodable
{
    @inlinable
    func encode(paramsTo container: inout UnkeyedEncodingContainer) throws {
        try dropLast.encode(paramsTo: &container)
        try container.encode(last)
    }
}

// Not a LinkedTuple
public extension SomeTuple0 {
    @inlinable
    init(paramsFrom container: inout UnkeyedDecodingContainer) throws {
        self.init()
    }
    @inlinable
    func encode(paramsTo container: inout UnkeyedEncodingContainer) throws {}
}

extension Tuple1: Decodable where Self: DecodableTuple {}
extension Tuple1: DecodableTuple where T1: Decodable {}
extension Tuple1: Encodable where Self: EncodableTuple {}
extension Tuple1: EncodableTuple where T1: Encodable {}

extension Tuple2: Decodable where Self: DecodableTuple {}
extension Tuple2: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple2: Encodable where Self: EncodableTuple {}
extension Tuple2: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple3: Decodable where Self: DecodableTuple {}
extension Tuple3: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple3: Encodable where Self: EncodableTuple {}
extension Tuple3: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple4: Decodable where Self: DecodableTuple {}
extension Tuple4: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple4: Encodable where Self: EncodableTuple {}
extension Tuple4: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple5: Decodable where Self: DecodableTuple {}
extension Tuple5: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple5: Encodable where Self: EncodableTuple {}
extension Tuple5: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple6: Decodable where Self: DecodableTuple {}
extension Tuple6: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple6: Encodable where Self: EncodableTuple {}
extension Tuple6: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple7: Decodable where Self: DecodableTuple {}
extension Tuple7: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple7: Encodable where Self: EncodableTuple {}
extension Tuple7: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple8: Decodable where Self: DecodableTuple {}
extension Tuple8: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple8: Encodable where Self: EncodableTuple {}
extension Tuple8: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple9: Decodable where Self: DecodableTuple {}
extension Tuple9: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple9: Encodable where Self: EncodableTuple {}
extension Tuple9: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple10: Decodable where Self: DecodableTuple {}
extension Tuple10: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple10: Encodable where Self: EncodableTuple {}
extension Tuple10: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple11: Decodable where Self: DecodableTuple {}
extension Tuple11: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple11: Encodable where Self: EncodableTuple {}
extension Tuple11: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple12: Decodable where Self: DecodableTuple {}
extension Tuple12: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple12: Encodable where Self: EncodableTuple {}
extension Tuple12: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple13: Decodable where Self: DecodableTuple {}
extension Tuple13: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple13: Encodable where Self: EncodableTuple {}
extension Tuple13: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple14: Decodable where Self: DecodableTuple {}
extension Tuple14: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple14: Encodable where Self: EncodableTuple {}
extension Tuple14: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}

extension Tuple15: Decodable where Self: DecodableTuple {}
extension Tuple15: DecodableTuple where DroppedLast: DecodableTuple, Last: Decodable {}
extension Tuple15: Encodable where Self: EncodableTuple {}
extension Tuple15: EncodableTuple where DroppedLast: EncodableTuple, Last: Encodable {}
