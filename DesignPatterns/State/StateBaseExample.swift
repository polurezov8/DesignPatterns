//
//  StateBaseExample.swift
//  State
//
//  Created by Dmitriy Polurezov on 10.06.2020.
//

import Foundation

protocol SimpleState {
    func isAuthorized(context: SimpleContext) -> Bool
    func userId(context: SimpleContext) -> String?
}

final class SimpleContext {
    private var state: SimpleState = UnauthorizedState()

    var isAuthorized: Bool {
        get {
            return state.isAuthorized(context: self)
        }
    }

    var userId: String? {
        get {
            return state.userId(context: self)
        }
    }

    func changeStateToAuthorized(userId: String) {
        state = AuthorizedState(userId: userId)
    }

    func changeStateToUnauthorized() {
        state = UnauthorizedState()
    }
}

class UnauthorizedState: SimpleState {
    func isAuthorized(context: SimpleContext) -> Bool {
        return false
    }

    func userId(context: SimpleContext) -> String? {
        return nil
    }
}

class AuthorizedState: SimpleState {
    let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func isAuthorized(context: SimpleContext) -> Bool {
        return true
    }

    func userId(context: SimpleContext) -> String? {
        return userId
    }
}

class StateBaseExampleUsage {

    func useBaseExample() {
        let userContext = SimpleContext()
        userContext.changeStateToAuthorized(userId: "admin")
        userContext.changeStateToUnauthorized()
    }
}
