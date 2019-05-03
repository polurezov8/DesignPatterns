//
//  LinkedList.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import Foundation

struct LinkedList<T> {
    var head: LinkedListNode<T>

    init(head: LinkedListNode<T>) {
        self.head = head
    }
}

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(current: head)
    }
}
