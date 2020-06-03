//
//  IteratorRealWorld.swift
//  Iterator
//
//  Created by Dmitriy Polurezov on 31.05.2020.
//

import XCTest

enum IterationType {
    case inOrder
    case preOrder
    case postOrder
}

class Tree<T> {

    var value: T
    var left: Tree<T>?
    var right: Tree<T>?

    init(_ value: T) {
        self.value = value
    }

    typealias Block = (T) -> ()

    func iterator(_ type: IterationType) -> AnyIterator<T> {
        var items: [T] = []
        switch type {
        case .inOrder:
            inOrder { items.append($0) }
        case .preOrder:
            preOrder { items.append($0) }
        case .postOrder:
            postOrder { items.append($0) }
        }

        /// Note:
        /// AnyIterator is used to hide the type signature of an internal
        /// iterator.
        return AnyIterator(items.makeIterator())
    }

    private func inOrder(_ body: Block) {
        left?.inOrder(body)
        body(value)
        right?.inOrder(body)
    }

    private func preOrder(_ body: Block) {
        body(value)
        left?.inOrder(body)
        right?.inOrder(body)
    }

    private func postOrder(_ body: Block) {
        left?.inOrder(body)
        right?.inOrder(body)
        body(value)
    }
}

class IteratorRealWorld: XCTestCase {

    func test() {
        let tree = Tree(1)
        tree.left = Tree(2)
        tree.right = Tree(3)

        debugPrint("Tree traversal: Inorder")
        clientCode(iterator: tree.iterator(.inOrder))

        debugPrint("\nTree traversal: Preorder")
        clientCode(iterator: tree.iterator(.preOrder))

        debugPrint("\nTree traversal: Postorder")
        clientCode(iterator: tree.iterator(.postOrder))
    }

    func clientCode<T>(iterator: AnyIterator<T>) {
        while case let item? = iterator.next() {
            debugPrint(item)
        }
    }
}
