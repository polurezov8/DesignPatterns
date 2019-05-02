//
//  MercedesDecorator.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

class MercedesDecorator: Mercedesable {
    private let decorator: Mercedesable

    required init(decorator: Mercedesable) {
        self.decorator = decorator
    }

    func getTitle() -> String {
        return decorator.getTitle()
    }

    func getPrice() -> Double {
        return decorator.getPrice()
    }
}
