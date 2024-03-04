//
//  Protocols.swift
//  
//
//  Created by Yehor Popovych on 05/07/2023.
//

import Foundation

public protocol SomeTuple0: OneTypeTuple, CodableTuple
    where STuple == ()
{
    init()
}
public extension SomeTuple0 {
    // TupleProtocol
    @inlinable init(_ t: STuple) { self.init() }
    @inlinable var tuple: STuple { get { () } set {} }
    @inlinable var anyArray: Array<Any> { array }
    @inlinable var paramsDescription: String { "" }
    @inlinable static var count: Int { 0 }
    // OneTypeTuple
    @inlinable var array: Array<SType> { [] }
}

public protocol SomeTuple1<T1>: ListTuple, OneTypeTuple where
    STuple == (T1), SType == T1,
    DroppedFirst: SomeTuple0,
    DroppedLast: SomeTuple0,
    First == T1, Last == T1
{
    associatedtype T1
    var _0: T1 { get set }
}
public extension SomeTuple1 {
    // TupleProtocol
    @inlinable var tuple: STuple { get { (_0) } set { _0 = newValue } }
    @inlinable var anyArray: Array<Any> { array }
    @inlinable static var count: Int { 1 }
    // OneTypeTuple
    @inlinable var array: Array<SType> { [_0] }
    // ListTuple
    @inlinable init(first: DroppedLast, last: Last) { self.init(last) }
    @inlinable init(first: First, last: DroppedFirst) { self.init(first) }
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _0 } set { _0 = newValue } }
    @inlinable var dropLast: DroppedLast { get { DroppedLast() } set {} }
    @inlinable var dropFirst: DroppedFirst { get { DroppedFirst() } set {} }
}

public protocol SomeTuple2<T1, T2>: ListTuple where
    STuple == (T1, T2),
    DroppedFirst: SomeTuple1<T2>,
    DroppedLast: SomeTuple1<T1>,
    First == T1, Last == T2
{
    associatedtype T1; associatedtype T2
    var _0: T1 { get set }; var _1: T2 { get set }
}
public extension SomeTuple2 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1] }
    @inlinable static var count: Int { 2 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _1 } set { _1 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast(_0) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst(_1) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple2 where Self: OneTypeTuple, SType == T1, T1 == T2 {
    @inlinable var array: Array<SType> { [_0, _1] }
}

public protocol SomeTuple3<T1, T2, T3>: ListTuple where
    STuple == (T1, T2, T3),
    DroppedFirst: SomeTuple2<T2, T3>,
    DroppedLast: SomeTuple2<T1, T2>,
    First == T1, Last == T3
{
    associatedtype T1; associatedtype T2; associatedtype T3
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
}
public extension SomeTuple3 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2] }
    @inlinable static var count: Int { 3 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _2 } set { _2 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple3 where Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3 {
    @inlinable var array: Array<SType> { [_0, _1, _2] }
}

public protocol SomeTuple4<T1, T2, T3, T4>: ListTuple where
    STuple == (T1, T2, T3, T4),
    DroppedFirst: SomeTuple3<T2, T3, T4>,
    DroppedLast: SomeTuple3<T1, T2, T3>,
    First == T1, Last == T4
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }
}
public extension SomeTuple4 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3] }
    @inlinable static var count: Int { 4 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _3 } set { _3 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple4 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3] }
}

public protocol SomeTuple5<T1, T2, T3, T4, T5>: ListTuple where
    STuple == (T1, T2, T3, T4, T5),
    DroppedFirst: SomeTuple4<T2, T3, T4, T5>,
    DroppedLast: SomeTuple4<T1, T2, T3, T4>,
    First == T1, Last == T5
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }
}
public extension SomeTuple5 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3, _4] }
    @inlinable static var count: Int { 5 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _4 } set { _4 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple5 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3, _4] }
}

public protocol SomeTuple6<T1, T2, T3, T4, T5, T6>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6),
    DroppedFirst: SomeTuple5<T2, T3, T4, T5, T6>,
    DroppedLast: SomeTuple5<T1, T2, T3, T4, T5>,
    First == T1, Last == T6
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
}
public extension SomeTuple6 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3, _4, _5] }
    @inlinable static var count: Int { 6 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _5 } set { _5 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple6 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3, _4, _5] }
}

public protocol SomeTuple7<T1, T2, T3, T4, T5, T6, T7>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7),
    DroppedFirst: SomeTuple6<T2, T3, T4, T5, T6, T7>,
    DroppedLast: SomeTuple6<T1, T2, T3, T4, T5, T6>,
    First == T1, Last == T7
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }
}
public extension SomeTuple7 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3, _4, _5, _6] }
    @inlinable static var count: Int { 7 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _6 } set { _6 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple7 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3, _4, _5, _6] }
}

public protocol SomeTuple8<T1, T2, T3, T4, T5, T6, T7, T8>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8),
    DroppedFirst: SomeTuple7<T2, T3, T4, T5, T6, T7, T8>,
    DroppedLast: SomeTuple7<T1, T2, T3, T4, T5, T6, T7>,
    First == T1, Last == T8
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }
}
public extension SomeTuple8 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3, _4, _5, _6, _7] }
    @inlinable static var count: Int { 8 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _7 } set { _7 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple8 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3, _4, _5, _6, _7] }
}

public protocol SomeTuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9),
    DroppedFirst: SomeTuple8<T2, T3, T4, T5, T6, T7, T8, T9>,
    DroppedLast: SomeTuple8<T1, T2, T3, T4, T5, T6, T7, T8>,
    First == T1, Last == T9
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
}
public extension SomeTuple9 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3, _4, _5, _6, _7, _8] }
    @inlinable static var count: Int { 9 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _8 } set { _8 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple9 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3, _4, _5, _6, _7, _8] }
}

public protocol SomeTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10),
    DroppedFirst: SomeTuple9<T2, T3, T4, T5, T6, T7, T8, T9, T10>,
    DroppedLast: SomeTuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9>,
    First == T1, Last == T10
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    associatedtype T10
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
    var _9: T10 { get set }
}
public extension SomeTuple10 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8, _9) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> { [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9] }
    @inlinable static var count: Int { 10 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _9 } set { _9 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7, _8)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8, _9)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple10 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9, T9 == T10
{
    @inlinable var array: Array<SType> { [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9] }
}

public protocol SomeTuple11<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>:
    ListTuple
where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11),
    DroppedFirst: SomeTuple10<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>,
    DroppedLast: SomeTuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>,
    First == T1, Last == T11
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    associatedtype T10; associatedtype T11
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
    var _9: T10 { get set }; var _10: T11 { get set }
}
public extension SomeTuple11 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10]
    }
    @inlinable static var count: Int { 11 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _10 } set { _10 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7, _8, _9)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8, _9, _10)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple11 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9, T9 == T10, T10 == T11
{
    @inlinable var array: Array<SType> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10]
    }
}

public protocol SomeTuple12<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>:
    ListTuple
where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12),
    DroppedFirst: SomeTuple11<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>,
    DroppedLast: SomeTuple11<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>,
    First == T1, Last == T12
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    associatedtype T10; associatedtype T11; associatedtype T12
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
    var _9: T10 { get set }; var _10: T11 { get set }; var _11: T12 { get set }
}
public extension SomeTuple12 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11]
    }
    @inlinable static var count: Int { 12 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _11 } set { _11 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple12 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9, T9 == T10, T10 == T11, T11 == T12
{
    @inlinable var array: Array<SType> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11]
    }
}

public protocol SomeTuple13<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13
>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13),
    DroppedFirst: SomeTuple12<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>,
    DroppedLast: SomeTuple12<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>,
    First == T1, Last == T13
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    associatedtype T10; associatedtype T11; associatedtype T12
    associatedtype T13
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
    var _9: T10 { get set }; var _10: T11 { get set }; var _11: T12 { get set }
    var _12: T13 { get set }
}
public extension SomeTuple13 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12]
    }
    @inlinable static var count: Int { 13 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _12 } set { _12 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple13 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9, T9 == T10, T10 == T11, T11 == T12,
    T12 == T13
{
    @inlinable var array: Array<SType> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12]
    }
}

public protocol SomeTuple14<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14
>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14),
    DroppedFirst:
        SomeTuple13<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>,
    DroppedLast:
        SomeTuple13<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>,
    First == T1, Last == T14
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    associatedtype T10; associatedtype T11; associatedtype T12
    associatedtype T13; associatedtype T14
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
    var _9: T10 { get set }; var _10: T11 { get set }; var _11: T12 { get set }
    var _12: T13 { get set }; var _13: T14 { get set }
}
public extension SomeTuple14 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13]
    }
    @inlinable static var count: Int { 14 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _13 } set { _13 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get { DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12)) }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get { DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13)) }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple14 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9, T9 == T10, T10 == T11, T11 == T12,
    T12 == T13, T13 == T14
{
    @inlinable var array: Array<SType> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13]
    }
}

public protocol SomeTuple15<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15
>: ListTuple where
    STuple == (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15),
    DroppedFirst:
        SomeTuple14<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>,
    DroppedLast:
        SomeTuple14<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>,
    First == T1, Last == T15
{
    associatedtype T1; associatedtype T2; associatedtype T3
    associatedtype T4; associatedtype T5; associatedtype T6
    associatedtype T7; associatedtype T8; associatedtype T9
    associatedtype T10; associatedtype T11; associatedtype T12
    associatedtype T13; associatedtype T14; associatedtype T15
    var _0: T1 { get set }; var _1: T2 { get set }; var _2: T3 { get set }
    var _3: T4 { get set }; var _4: T5 { get set }; var _5: T6 { get set }
    var _6: T7 { get set }; var _7: T8 { get set }; var _8: T9 { get set }
    var _9: T10 { get set }; var _10: T11 { get set }; var _11: T12 { get set }
    var _12: T13 { get set }; var _13: T14 { get set }; var _14: T15 { get set }
}
public extension SomeTuple15 {
    // TupleProtocol
    @inlinable var tuple: STuple {
        get { (_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14) }
        set { self = Self(newValue) }
    }
    @inlinable var anyArray: Array<Any> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14]
    }
    @inlinable static var count: Int { 15 }
    // ListTuple
    @inlinable var first: First { get { _0 } set { _0 = newValue } }
    @inlinable var last: Last { get { _14 } set { _14 = newValue } }
    @inlinable var dropLast: DroppedLast {
        get {
            DroppedLast((_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13))
        }
        set { self = Self(first: newValue, last: last) }
    }
    @inlinable var dropFirst: DroppedFirst {
        get {
            DroppedFirst((_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14))
        }
        set { self = Self(first: first, last: newValue) }
    }
}
public extension SomeTuple15 where
    Self: OneTypeTuple, SType == T1, T1 == T2, T2 == T3, T3 == T4, T4 == T5,
    T5 == T6, T6 == T7, T7 == T8, T8 == T9, T9 == T10, T10 == T11, T11 == T12,
    T12 == T13, T13 == T14, T14 == T15
{
    @inlinable var array: Array<SType> {
        [_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14]
    }
}
