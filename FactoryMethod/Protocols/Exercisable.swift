//
//  Exercisable.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

protocol Exercisable: class {
    var name: String { get }
    func start()
    func stop()
}
