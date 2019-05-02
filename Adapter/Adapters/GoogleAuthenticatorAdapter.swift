//
//  GoogleAuthenticatorAdapter.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

class GoogleAuthenticatorAdapter: Authentificatible {
    private let authenticator = GoogleAuthenticator()

    public func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void) {
        authenticator.login(with: email, and: password) { currentUser, error in
            guard let currentUser = currentUser else {
                failure(error)
                return
            }

            let user = User(email: currentUser.email, password: currentUser.password)
            let token = Token(value: currentUser.token)
            success(user, token)
        }
    }
}
