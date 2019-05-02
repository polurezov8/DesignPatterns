//
//  Authentificatible.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

public protocol Authentificatible {
    func login(with email: String, and password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void)
}
