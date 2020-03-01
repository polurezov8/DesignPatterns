//
//  PrototypeBase.swift
//  Prototype
//
//  Created by Dmitriy Polurezov on 01.03.2020.
//

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
