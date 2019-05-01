//
//  Copyable.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
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
