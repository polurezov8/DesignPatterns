//
//  LinkedListIterator.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import Foundation

struct LinkedListIterator<T>: IteratorProtocol {
    var current: LinkedListNode<T>

    mutating func next() -> T? {
        switch current {
        case let .value(element, next):
            current = next
            return element
        case .end:
            return nil
        }
    }
}
