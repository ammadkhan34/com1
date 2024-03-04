//
//  Equatable.swift
//  
//
//  Created by Yehor Popovych on 06/07/2023.
//

import Foundation

@inlinable
public func == (left: any SomeTuple0, right: any SomeTuple0) -> Bool { true }

@inlinable
public func ==<T: SomeTuple & Equatable>(left: T, right: T.STuple) -> Bool {
    left == T(right)
}

@inlinable
public func ==<T: SomeTuple & Equatable>(left: T.STuple, right: T) -> Bool {
    right == T(left)
}
