//
//  AlloyWheels.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

class AlloyWheels: MercedesDecorator {
    required init(decorator: Mercedesable) {
        super.init(decorator: decorator)
    }

    override func getTitle() -> String {
        return super.getTitle() + "Sport equipment with a alloy wheels"
    }

    override func getPrice() -> Double {
        return super.getPrice() + 1500
    }
}
