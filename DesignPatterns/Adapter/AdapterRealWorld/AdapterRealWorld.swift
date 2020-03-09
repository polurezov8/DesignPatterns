// MARK: - GoogleUser
public struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}

// MARK: - GoogleAuthenticator
public class GoogleAuthenticator {
    public func login(email: String, password: String, completion: @escaping (GoogleUser?, Error?) -> Void) {
        // Make networking calls that return a token string using Google SDK.
        let token = "special-token-value"
        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
    }
}

// MARK: - User
public struct User {
    public let email: String
    public let password: String
}

// MARK: - Token
public struct Token {
    public let value: String
}

// MARK: - AuthenticationService
public protocol AuthenticationService {
    func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void)
}

// MARK: - Adapter
public class GoogleAuthenticatorAdapter {

    // MARK: - Private properties
    private var authenticator = GoogleAuthenticator()
}

// MARK: - AuthenticationService
extension GoogleAuthenticatorAdapter: AuthenticationService {
    public func login(email: String, password: String, success: @escaping (User, Token) -> Void, failure: @escaping (Error?) -> Void) {
        authenticator.login(email: email, password: password) { googleUser, error in
            guard let googleUser = googleUser else {
                failure(error)
                return
            }

            let user = User(email: googleUser.email, password: googleUser.password)
            let token = Token(value: googleUser.token)
            success(user, token)
        }
    }
}


