//
//  Singleton.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

final class Singleton {
    // MARK: - Singleton instance
    static let sharedInstance = Singleton()

    // MARK: - Initialization
    private init() {
    }
}
