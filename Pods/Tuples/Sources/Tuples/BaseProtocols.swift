//
//  BaseProtocols.swift
//  
//
//  Created by Yehor Popovych on 05/07/2023.
//

import Foundation

public protocol SomeTuple: CustomStringConvertible {
    associatedtype STuple
    init(_ t: STuple)
    
    var anyArray: Array<Any> { get }
    var tuple: STuple { get set }
    
    var paramsDescription: String { get }
    
    var count: Int { get }
    static var count: Int { get }
}

public extension SomeTuple {
    @inlinable var description: String { "(\(paramsDescription))" }
    @inlinable var count: Int { Self.count }
}

public protocol OneTypeTuple<SType>: SomeTuple {
    associatedtype SType
    var array: Array<SType> { get }
    var base: any SomeTuple { get }
}

public extension OneTypeTuple {
    @inlinable var base: any SomeTuple { self }
}

public protocol ListTuple: SomeTuple {
    associatedtype First
    associatedtype Last
    associatedtype DroppedFirst: SomeTuple
    associatedtype DroppedLast: SomeTuple
    
    init(first: DroppedLast, last: Last)
    init(first: First, last: DroppedFirst)
    
    var first: First { get set }
    var last: Last { get set }
    var dropLast: DroppedLast { get set }
    var dropFirst: DroppedFirst { get set }
}

public extension ListTuple {
    @inlinable
    init(first: DroppedLast.STuple, last: Last) {
        self.init(first: DroppedLast(first), last: last)
    }
    @inlinable
    init(first: First, last: DroppedFirst.STuple) {
        self.init(first: first, last: DroppedFirst(last))
    }
    @inlinable
    var paramsDescription: String {
        count > 1 ? "\(dropLast.paramsDescription), \(last)" : "\(last)"
    }
}

public protocol DecodableTuple: SomeTuple, Decodable {
    init(paramsFrom container: inout UnkeyedDecodingContainer) throws
}

public protocol EncodableTuple: SomeTuple, Encodable {
    func encode(paramsTo container: inout UnkeyedEncodingContainer) throws
}

public typealias CodableTuple = DecodableTuple & EncodableTuple
