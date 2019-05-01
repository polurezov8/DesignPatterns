//
//  BedroomFactory.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

class BedroomFactory: AbstractFactory {
    func createChair() -> Chairable {
        return BedroomChair()
    }

    func createSofa() -> Sofable {
        return BedroomSofa()
    }
}
