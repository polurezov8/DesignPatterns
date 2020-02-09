//
//  Copyable.swift
//  
//
//  Created by Dmitriy Poluriezov on 9/2/20.
//

import UIKit

public protocol Copyable {
    init(_ prototype: Self)
}

extension Copyable {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

extension Array where Element: Copyable {
    public func deepCopy() -> [Element] {
        return map { $0.copy() }
    }
}
