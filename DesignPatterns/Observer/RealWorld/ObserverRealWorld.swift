//
//  ObserverRealWorld.swift
//  Observer
//
//  Created by Dmitriy Polurezov on 10.06.2020.
//

import XCTest

protocol CartSubscriber: CustomStringConvertible {
    func accept(changed cart: [Product])
}

protocol Product {
    var id: Int { get }
    var name: String { get }
    var price: Double { get }

    func isEqual(to product: Product) -> Bool
}

extension Product {
    func isEqual(to product: Product) -> Bool {
        return id == product.id
    }
}

struct Food: Product {

    var id: Int
    var name: String
    var price: Double

    /// Food-specific properties
    var calories: Int
}

struct Clothes: Product {

    var id: Int
    var name: String
    var price: Double

    /// Clothes-specific properties
    var size: String
}

class CartManager {

    private lazy var cart = [Product]()
    private lazy var subscribers = [CartSubscriber]()

    func add(subscriber: CartSubscriber) {
        debugPrint("CartManager: I'am adding a new subscriber: \(subscriber.description)")
        subscribers.append(subscriber)
    }

    func add(product: Product) {
        debugPrint("\nCartManager: I'am adding a new product: \(product.name)")
        cart.append(product)
        notifySubscribers()
    }

    func remove(subscriber filter: (CartSubscriber) -> (Bool)) {
        guard let index = subscribers.firstIndex(where: filter) else {
            return
        }

        subscribers.remove(at: index)
    }

    func remove(product: Product) {
        guard let index = cart.firstIndex(where: { $0.isEqual(to: product) }) else {
            return
        }

        debugPrint("\nCartManager: Product '\(product.name)' is removed from a cart")
        cart.remove(at: index)
        notifySubscribers()
    }

    private func notifySubscribers() {
        subscribers.forEach { $0.accept(changed: cart) }
    }
}

extension UINavigationBar: CartSubscriber {

    func accept(changed cart: [Product]) {
        debugPrint("UINavigationBar: Updating an appearance of navigation items")
    }

    open override var description: String {
        return "UINavigationBar"
    }
}

class CartViewController: UIViewController, CartSubscriber {

    func accept(changed cart: [Product]) {
        debugPrint("CartViewController: Updating an appearance of a list view with products")
    }

    open override var description: String {
        return "CartViewController"
    }
}

class ObserverRealWorld: XCTestCase {

    func test() {
        let cartManager = CartManager()

        let navigationBar = UINavigationBar()
        let cartVC = CartViewController()

        cartManager.add(subscriber: navigationBar)
        cartManager.add(subscriber: cartVC)

        let apple = Food(id: 111, name: "Apple", price: 10, calories: 20)
        cartManager.add(product: apple)

        let tShirt = Clothes(id: 222, name: "T-shirt", price: 200, size: "L")
        cartManager.add(product: tShirt)

        cartManager.remove(product: apple)
    }
}
