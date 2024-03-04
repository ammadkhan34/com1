//
//  Constructors.swift
//  
//
//  Created by Yehor Popovych on 05/07/2023.
//

import Foundation

@inlinable
public func TL<T>() -> Tuple0<T> { Tuple0() }
@inlinable
public func TL<T>(_ t: ()) -> Tuple0<T> { Tuple0() }

@inlinable
public func TL<T1>(_ t: (T1)) -> Tuple1<T1> { Tuple1(t) }

@inlinable
public func TL<T1, T2>(_ t: (T1, T2)) -> Tuple2<T1, T2> { Tuple2(t) }
@inlinable
public func TL<T1, T2>(_ v0: T1, _ v1: T2) -> Tuple2<T1, T2> { Tuple2(v0, v1) }

@inlinable
public func TL<T1, T2, T3>(
    _ t: (T1, T2, T3)
) -> Tuple3<T1, T2, T3> { Tuple3(t) }
@inlinable
public func TL<T1, T2, T3>(
    _ v0: T1, _ v1: T2, _ v2: T3
) -> Tuple3<T1, T2, T3> { Tuple3(v0, v1, v2) }

@inlinable
public func TL<T1, T2, T3, T4>(
    _ t: (T1, T2, T3, T4)
) -> Tuple4<T1, T2, T3, T4> { Tuple4(t) }
@inlinable
public func TL<T1, T2, T3, T4>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4
) -> Tuple4<T1, T2, T3, T4> { Tuple4(v0, v1, v2, v3) }

@inlinable
public func TL<T1, T2, T3, T4, T5>(
    _ t: (T1, T2, T3, T4, T5)
) -> Tuple5<T1, T2, T3, T4, T5> { Tuple5(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5
) -> Tuple5<T1, T2, T3, T4, T5> { Tuple5(v0, v1, v2, v3, v4) }

@inlinable
public func TL<T1, T2, T3, T4, T5, T6>(
    _ t: (T1, T2, T3, T4, T5, T6)
) -> Tuple6<T1, T2, T3, T4, T5, T6> { Tuple6(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6
) -> Tuple6<T1, T2, T3, T4, T5, T6> { Tuple6(v0, v1, v2, v3, v4, v5) }

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7>(
    _ t: (T1, T2, T3, T4, T5, T6, T7)
) -> Tuple7<T1, T2, T3, T4, T5, T6, T7> { Tuple7(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7
) -> Tuple7<T1, T2, T3, T4, T5, T6, T7> { Tuple7(v0, v1, v2, v3, v4, v5, v6) }

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8)
) -> Tuple8<T1, T2, T3, T4, T5, T6, T7, T8> { Tuple8(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8
) -> Tuple8<T1, T2, T3, T4, T5, T6, T7, T8> {
    Tuple8(v0, v1, v2, v3, v4, v5, v6, v7)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9)
) -> Tuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9> { Tuple9(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9
) -> Tuple9<T1, T2, T3, T4, T5, T6, T7, T8, T9> {
    Tuple9(v0, v1, v2, v3, v4, v5, v6, v7, v8)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10)
) -> Tuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> { Tuple10(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9, _ v9: T10
) -> Tuple10<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10> {
    Tuple10(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11)
) -> Tuple11<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11> { Tuple11(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11
) -> Tuple11<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11> {
    Tuple11(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12)
) -> Tuple12<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12> { Tuple12(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12
) -> Tuple12<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12> {
    Tuple12(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13)
) -> Tuple13<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13> { Tuple13(t) }
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12, _ v12: T13
) -> Tuple13<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13> {
    Tuple13(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14)
) -> Tuple14<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14> {
    Tuple14(t)
}
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12, _ v12: T13,
    _ v13: T14
) -> Tuple14<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14> {
    Tuple14(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
}

@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(
    _ t: (T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15)
) -> Tuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15> {
    Tuple15(t)
}
@inlinable
public func TL<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15>(
    _ v0: T1, _ v1: T2, _ v2: T3, _ v3: T4, _ v4: T5, _ v5: T6, _ v6: T7,
    _ v7: T8, _ v8: T9, _ v9: T10, _ v10: T11, _ v11: T12, _ v12: T13,
    _ v13: T14, _ v14: T15
) -> Tuple15<T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15> {
    Tuple15(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
}

public func TL<S: Collection>(array: S) -> (any OneTypeTuple<S.Element>)? {
    let count = array.count
    guard count > 0 else { return Tuple0<S.Element>() }
    var i = array.makeIterator()
    switch count {
    case 1: return Tuple1(i.next()!)
    case 2: return Tuple2(i.next()!, i.next()!)
    case 3: return Tuple3(i.next()!, i.next()!, i.next()!)
    case 4: return Tuple4(i.next()!, i.next()!, i.next()!, i.next()!)
    case 5:
        return Tuple5(i.next()!, i.next()!, i.next()!, i.next()!, i.next()!)
    case 6:
        return Tuple6(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!
        )
    case 7:
        return Tuple7(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!
        )
    case 8:
        return Tuple8(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!)
    case 9:
        return Tuple9(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!)
    case 10:
        return Tuple10(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!, i.next()!
        )
    case 11:
        return Tuple11(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!
        )
    case 12:
        return Tuple12(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!
        )
    case 13:
        return Tuple13(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!
        )
    case 14:
        return Tuple14(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!
        )
    case 15:
        return Tuple15(
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!, i.next()!, i.next()!, i.next()!,
            i.next()!, i.next()!, i.next()!
        )
    default: return nil
    }
}
