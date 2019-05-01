//
//  AbstractFactory.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

protocol AbstractFactory {
    func createChair() -> Chairable
    func createSofa() -> Sofable
}
