//
//  LinkedListNode.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/3/19.
//

import Foundation

indirect enum LinkedListNode<T> {
    case value(element: T, next: LinkedListNode<T>)
    case end
}
