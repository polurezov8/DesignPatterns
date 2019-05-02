//
//  TwitterAuthenticator.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/2/19.
//

import Foundation

public class TwitterAuthenticator {
    public func login(with email: String, and password: String, completion: @escaping (TwitterUser?, Error?) -> Void) {
        let token = "token_value"
        let user = TwitterUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}
