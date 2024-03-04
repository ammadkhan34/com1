//
//  Tuples.swift
//  
//
//  Created by Yehor Popovych on 05/07/2023.
//

import Foundation

public typealias VoidTuple = Tuple0<Void>

public struct Tuple0<T>: SomeTuple0, Equatable, Hashable {
    public typealias SType = T
    @inlinable public init() {}
    @inlinable var void: VoidTuple { VoidTuple() }
    @inlinable func typed<T>(_ t: T.Type) -> Tuple0<T> { Tuple0<T>() }
    @inlinable func typed<T>() -> Tuple0<T> { Tuple0<T>() }
}

public struct Tuple1<T1>: SomeTuple1 {
    public typealias SType = T1
    public typealias STuple = (T1)
    public typealias First = T1
    public typealias Last = T1
    public typealias DroppedLast = Tuple0<T1>
    public typealias DroppedFirst = Tuple0<T1>
    
    public var _0: T1
    
    @inlinable public init(_ t: STuple) { _0 = t }
}
extension Tuple1: Equatable where T1: Equatable {}
extension Tuple1: Hashable where T1: Hashable {}

public struct Tuple2<T1, T2>: SomeTuple2 {
    public typealias STuple = (T1, T2)
    public typealias First = T1
    public typealias Last = T2
    public typealias DroppedLast = Tuple1<T1>
    public typealias DroppedFirst = Tuple1<T2>
    
    public var _0: T1; public var _1: T2
    
    @inlinable public init(_ t: STuple) { self.init(t.0, t.1) }
    @inlinable public init(_ v0: T1, _ v1: T2) {
        _0 = v0; _1 = v1
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(first._0, last)
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(first, last._0)
    }
}
extension Tuple2: OneTypeTuple where T1 == T2 {}
extension Tuple2: Equatable where T1: Equatable, T2: Equatable {}
extension Tuple2: Hashable where T1: Hashable, T2: Hashable {}

public struct Tuple3<T1, T2, T3>: SomeTuple3 {
    public typealias STuple = (T1, T2, T3)
    public typealias First = T1
    public typealias Last = T3
    public typealias DroppedLast = Tuple2<T1, T2>
    public typealias DroppedFirst = Tuple2<T2, T3>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    
    @inlinable public init(_ t: STuple) { self.init(t.0, t.1, t.2) }
    @inlinable public init(_ v0: T1, _ v1: T2, _ v2: T3) {
        _0 = v0; _1 = v1; _2 = v2
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(first._0, first._1, last)
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(first, last._0, last._1)
    }
}
extension Tuple3: OneTypeTuple where T1 == T2, T2 == T3 {}
extension Tuple3: Equatable where T1: Equatable, T2: Equatable, T3: Equatable {}
extension Tuple3: Hashable where T1: Hashable, T2: Hashable, T3: Hashable {}

public struct Tuple4<T1, T2, T3, T4>: SomeTuple4 {
    public typealias STuple = (T1, T2, T3, T4)
    public typealias First = T1
    public typealias Last = T4
    public typealias DroppedLast = Tuple3<T1, T2, T3>
    public typealias DroppedFirst = Tuple3<T2, T3, T4>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4
    
    @inlinable public init(_ t: STuple) { self.init(t.0, t.1, t.2, t.3) }
    @inlinable public init(_ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(first._0, first._1, first._2, last)
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(first, last._0, last._1, last._2)
    }
}
extension Tuple4: OneTypeTuple where T1 == T2, T2 == T3, T3 == T4 {}
extension Tuple4: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable {}
extension Tuple4: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable {}

public struct Tuple5<T1, T2, T3, T4, T5>: SomeTuple5 {
    public typealias STuple = (T1, T2, T3, T4, T5)
    public typealias First = T1
    public typealias Last = T5
    public typealias DroppedLast = Tuple4<T1, T2, T3, T4>
    public typealias DroppedFirst = Tuple4<T2, T3, T4, T5>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5
    
    @inlinable public init(_ t: STuple) { self.init(t.0, t.1, t.2, t.3, t.4) }
    @inlinable public init(_ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(first._0, first._1, first._2, first._3, last)
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(first, last._0, last._1, last._2, last._3)
    }
}
extension Tuple5: OneTypeTuple where T1 == T2, T2 == T3, T3 == T4, T4 == T5 {}
extension Tuple5: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable {}
extension Tuple5: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable {}

public struct Tuple6<T1, T2, T3, T4, T5, T6>: SomeTuple6 {
    public typealias STuple = (T1, T2, T3, T4, T5, T6)
    public typealias First = T1
    public typealias Last = T6
    public typealias DroppedLast = Tuple5<T1, T2, T3, T4, T5>
    public typealias DroppedFirst = Tuple5<T2, T3, T4, T5, T6>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    
    @inlinable public init(_ t: STuple) {
        self.init(t.0, t.1, t.2, t.3, t.4, t.5)
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(first._0, first._1, first._2, first._3, first._4, last)
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(first, last._0, last._1, last._2, last._3, last._4)
    }
}
extension Tuple6: OneTypeTuple where T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6 {}
extension Tuple6: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable {}
extension Tuple6: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable {}

public struct Tuple7<T1, T2, T3, T4, T5, T6, T7>: SomeTuple7 {
    public typealias STuple = (T1, T2, T3, T4, T5, T6, T7)
    public typealias First = T1
    public typealias Last = T7
    public typealias DroppedLast = Tuple6<T1, T2, T3, T4, T5, T6>
    public typealias DroppedFirst = Tuple6<T2, T3, T4, T5, T6, T7>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7
    
    @inlinable public init(_ t: STuple) {
        self.init(t.0, t.1, t.2, t.3, t.4, t.5, t.6)
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5
        )
    }
}
extension Tuple7: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7 {}
extension Tuple7: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable {}
extension Tuple7: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable {}

public struct Tuple8<T1, T2, T3, T4, T5, T6, T7, T8>: SomeTuple8 {
    public typealias STuple = (T1, T2, T3, T4, T5, T6, T7, T8)
    public typealias First = T1
    public typealias Last = T8
    public typealias DroppedLast = Tuple7<T1, T2, T3, T4, T5, T6, T7>
    public typealias DroppedFirst = Tuple7<T2, T3, T4, T5, T6, T7, T8>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8
    
    @inlinable public init(_ t: STuple) {
        self.init(t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7)
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6
        )
    }
}
extension Tuple8: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8 {}
extension Tuple8: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable {}
extension Tuple8: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable {}

public struct Tuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9>: SomeTuple9 {
    public typealias STuple = (T1, T2, T3, T4, T5, T6, T7, T8, T9)
    public typealias First = T1
    public typealias Last = T9
    public typealias DroppedLast = Tuple8<T1, T2, T3, T4, T5, T6, T7, T8>
    public typealias DroppedFirst = Tuple8<T2, T3, T4, T5, T6, T7, T8, T9>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    
    @inlinable public init(_ t: STuple) {
        self.init(t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8)
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7
        )
    }
}
extension Tuple9: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9 {}
extension Tuple9: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable {}
extension Tuple9: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable {}

public struct Tuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>: SomeTuple10 {
    public typealias STuple = (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)
    public typealias First = T1
    public typealias Last = T10
    public typealias DroppedLast =
        Tuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9>
    public typealias DroppedFirst =
        Tuple9<T2, T3, T4, T5, T6, T7, T8, T9, T10>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    public var _9: T10
    
    @inlinable public init(_ t: STuple) {
        self.init(t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8, t.9)
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9, _ v9: T10
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8; _9 = v9
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, first._8, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7, last._8
        )
    }
}
extension Tuple10: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9, T9 == T10 {}
extension Tuple10: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable, T10: Equatable {}
extension Tuple10: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable, T10: Hashable {}

public struct Tuple11<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>: SomeTuple11 {
    public typealias STuple = (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)
    public typealias First = T1
    public typealias Last = T11
    public typealias DroppedLast =
        Tuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>
    public typealias DroppedFirst =
        Tuple10<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    public var _9: T10; public var _10: T11
    
    @inlinable public init(_ t: STuple) {
        self.init(t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8, t.9, t.10)
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8; _9 = v9; _10 = v10
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, first._8, first._9, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7, last._8, last._9
        )
    }
}
extension Tuple11: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9, T9 == T10, T10 == T11 {}
extension Tuple11: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable, T10: Equatable,
    T11: Equatable {}
extension Tuple11: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable, T10: Hashable,
    T11: Hashable {}

public struct Tuple12<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12
>: SomeTuple12 {
    public typealias STuple =
        (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)
    public typealias First = T1
    public typealias Last = T12
    public typealias DroppedLast =
        Tuple11<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>
    public typealias DroppedFirst =
        Tuple11<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    public var _9: T10; public var _10: T11; public var _11: T12
    
    @inlinable public init(_ t: STuple) {
        self.init(
            t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8, t.9, t.10, t.11
        )
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8; _9 = v9; _10 = v10; _11 = v11
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, first._8, first._9, first._10, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7, last._8, last._9, last._10
        )
    }
}
extension Tuple12: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9, T9 == T10, T10 == T11, T11 == T12 {}
extension Tuple12: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable, T10: Equatable,
    T11: Equatable, T12: Equatable {}
extension Tuple12: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable, T10: Hashable,
    T11: Hashable, T12: Hashable {}

public struct Tuple13<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13
>: SomeTuple13 {
    public typealias STuple =
        (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)
    public typealias First = T1
    public typealias Last = T13
    public typealias DroppedLast =
        Tuple12<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>
    public typealias DroppedFirst =
        Tuple12<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    public var _9: T10; public var _10: T11; public var _11: T12
    public var _12: T13
    
    @inlinable public init(_ t: STuple) {
        self.init(
            t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8, t.9, t.10, t.11,
            t.12
        )
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12,
        _ v12: T13
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8; _9 = v9; _10 = v10; _11 = v11; _12 = v12
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, first._8, first._9, first._10, first._11,
            last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7, last._8, last._9, last._10, last._11
        )
    }
}
extension Tuple13: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9, T9 == T10, T10 == T11, T11 == T12, T12 == T13 {}
extension Tuple13: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable, T10: Equatable,
    T11: Equatable, T12: Equatable, T13: Equatable {}
extension Tuple13: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable, T10: Hashable,
    T11: Hashable, T12: Hashable, T13: Hashable {}

public struct Tuple14<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14
>: SomeTuple14 {
    public typealias STuple =
        (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)
    public typealias First = T1
    public typealias Last = T14
    public typealias DroppedLast =
        Tuple13<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>
    public typealias DroppedFirst =
        Tuple13<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    public var _9: T10; public var _10: T11; public var _11: T12
    public var _12: T13; public var _13: T14
    
    @inlinable public init(_ t: STuple) {
        self.init(
            t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8, t.9, t.10, t.11,
            t.12, t.13
        )
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12,
        _ v12: T13, _ v13: T14
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8; _9 = v9; _10 = v10; _11 = v11; _12 = v12
        _13 = v13
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, first._8, first._9, first._10, first._11,
            first._12, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7, last._8, last._9, last._10, last._11, last._12
        )
    }
}
extension Tuple14: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9, T9 == T10, T10 == T11, T11 == T12, T12 == T13, T13 == T14 {}
extension Tuple14: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable, T10: Equatable,
    T11: Equatable, T12: Equatable, T13: Equatable, T14: Equatable {}
extension Tuple14: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable, T10: Hashable,
    T11: Hashable, T12: Hashable, T13: Hashable, T14: Hashable {}

public struct Tuple15<
    T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15
>: SomeTuple15 {
    public typealias STuple =
        (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)
    public typealias First = T1
    public typealias Last = T15
    public typealias DroppedLast =
        Tuple14<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>
    public typealias DroppedFirst =
        Tuple14<T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>
    
    public var _0: T1; public var _1: T2; public var _2: T3
    public var _3: T4; public var _4: T5; public var _5: T6
    public var _6: T7; public var _7: T8; public var _8: T9
    public var _9: T10; public var _10: T11; public var _11: T12
    public var _12: T13; public var _13: T14; public var _14: T15
    
    @inlinable public init(_ t: STuple) {
        self.init(
            t.0, t.1, t.2, t.3, t.4, t.5, t.6, t.7, t.8, t.9, t.10, t.11,
            t.12, t.13, t.14
        )
    }
    @inlinable public init(
        _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6,
        _ v6: T7, _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12,
        _ v12: T13, _ v13: T14, _ v14: T15
    ) {
        _0 = v0; _1 = v1; _2 = v2; _3 = v3; _4 = v4; _5 = v5; _6 = v6
        _7 = v7; _8 = v8; _9 = v9; _10 = v10; _11 = v11; _12 = v12
        _13 = v13; _14 = v14
    }
    @inlinable public init(first: DroppedLast, last: Last) {
        self.init(
            first._0, first._1, first._2, first._3, first._4, first._5,
            first._6, first._7, first._8, first._9, first._10, first._11,
            first._12, first._13, last
        )
    }
    @inlinable public init(first: First, last: DroppedFirst) {
        self.init(
            first, last._0, last._1, last._2, last._3, last._4, last._5,
            last._6, last._7, last._8, last._9, last._10, last._11, last._12,
            last._13
        )
    }
}
extension Tuple15: OneTypeTuple where
    T1 == T2, T2 == T3, T3 == T4, T4 == T5, T5 == T6, T6 == T7, T7 == T8,
    T8 == T9, T9 == T10, T10 == T11, T11 == T12, T12 == T13, T13 == T14,
    T14 == T15 {}
extension Tuple15: Equatable where
    T1: Equatable, T2: Equatable, T3: Equatable, T4: Equatable, T5: Equatable,
    T6: Equatable, T7: Equatable, T8: Equatable, T9: Equatable, T10: Equatable,
    T11: Equatable, T12: Equatable, T13: Equatable, T14: Equatable,
    T15: Equatable {}
extension Tuple15: Hashable where
    T1: Hashable, T2: Hashable, T3: Hashable, T4: Hashable, T5: Hashable,
    T6: Hashable, T7: Hashable, T8: Hashable, T9: Hashable, T10: Hashable,
    T11: Hashable, T12: Hashable, T13: Hashable, T14: Hashable,
    T15: Hashable {}
