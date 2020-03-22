//
//  FacadeRealWorld.swift
//  Facade
//
//  Created by Dmitriy Polurezov on 22.03.2020.
//

import Foundation

// MARK: - Dependencies
public struct Customer {
    public let identifier: String
    public var address: String
    public var name: String
}

extension Customer: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    public static func ==(lhs: Customer,
                          rhs: Customer) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

public struct Product {
    public let identifier: String
    public var name: String
    public var cost: Double
}

extension Product: Hashable {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    public static func ==(lhs: Product,
                          rhs: Product) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

public class InventoryDatabase {
    public var inventory: [Product: Int] = [:]

    public init(inventory: [Product: Int]) {
        self.inventory = inventory
    }
}

public class ShippingDatabase {
    public var pendingShipments: [Customer: [Product]] = [:]
}

// MARK: - Facade
public class OrderFacade {
    public let inventoryDatabase: InventoryDatabase
    public let shippingDatabase: ShippingDatabase

    public init(inventoryDatabase: InventoryDatabase, shippingDatabase: ShippingDatabase) {
        self.inventoryDatabase = inventoryDatabase
        self.shippingDatabase = shippingDatabase
    }

    public func placeOrder(for product: Product,
                           by customer: Customer) {
        debugPrint("Place order for '\(product.name)' by '\(customer.name)'")

        let count = inventoryDatabase.inventory[product, default: 0]
        guard count > 0 else {
            debugPrint("'\(product.name)' is out of stock!")
            return
        }

        inventoryDatabase.inventory[product] = count - 1

        var shipments = shippingDatabase.pendingShipments[customer, default: []]
        shipments.append(product)
        shippingDatabase.pendingShipments[customer] = shipments

        debugPrint("Order placed for '\(product.name)' " +
            "by '\(customer.name)'")
    }
}

class ClientCode {
    // MARK: - Example
    func example() {
        let rayDoodle = Product(identifier: "product-001", name: "Ray's doodle", cost: 0.25)
        let vickiPoodle = Product(identifier: "product-002", name: "Vicki's prized poodle", cost: 1000)
        let inventoryDatabase = InventoryDatabase(inventory: [rayDoodle: 50, vickiPoodle : 1])

        let orderFacade = OrderFacade(inventoryDatabase: inventoryDatabase, shippingDatabase: ShippingDatabase())

        let customer = Customer(identifier: "customer-001", address: "1600 Pennsylvania Ave, Washington, DC 20006", name: "Johnny Appleseed")

        orderFacade.placeOrder(for: vickiPoodle, by: customer)
    }
}
