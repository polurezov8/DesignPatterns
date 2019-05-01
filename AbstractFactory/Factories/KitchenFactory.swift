//
//  KitchenFactory.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

class KitchenFactory: AbstractFactory {
    func createChair() -> Chairable {
        return KitchenChair()
    }

    func createSofa() -> Sofable {
        return KitchenSofa()
    }
}
