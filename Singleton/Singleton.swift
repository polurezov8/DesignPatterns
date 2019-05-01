//
//  Singleton.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

final class Singleton {

    static let sharedInstance = Singleton()

    private init() {
    }
}
