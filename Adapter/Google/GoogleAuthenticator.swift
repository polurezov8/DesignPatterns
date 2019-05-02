//
//  GoogleAuthenticator.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

public class GoogleAuthenticator {
    public func login(with email: String, and password: String, completion: @escaping (GoogleUser?, Error?) -> Void) {
        let token = "token_value"
        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}
