import UIKit

/// Adapter Design Pattern
///
/// Intent: Convert the interface of a class into the interface clients expect.
/// Adapter lets classes work together that couldn't work otherwise because of
/// incompatible interfaces.
protocol AuthService {
    func presentAuthFlow(from viewController: UIViewController)
}

class FacebookAuthSDK {

    func presentAuthFlow(from viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Facebook WebView has been shown.")
    }
}

extension FacebookAuthSDK: AuthService {
    /// This extension just tells a compiler that both SDKs have the same
    /// interface.
}

class TwitterAuthSDK {

    func startAuthorization(with viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Twitter WebView has been shown. Users will be happy :)")
    }
}

extension TwitterAuthSDK: AuthService {
    /// This is an adapter
    ///
    /// Yeah, we are able to not create another class and just extend an
    /// existing one

    func presentAuthFlow(from viewController: UIViewController) {
        print("The Adapter is called! Redirecting to the original method...")
        self.startAuthorization(with: viewController)
    }
}
