import XCTest

/// Паттерн Заместитель
///
/// Назначение: Позволяет подставлять вместо реальных объектов специальные
/// объекты-заменители. Эти объекты перехватывают вызовы к оригинальному
/// объекту, позволяя сделать что-то до или после передачи вызова оригиналу.
///
/// Пример: Существует бесчисленное множество направлений, где могут быть
/// использованы заместители: кэширование, логирование, контроль доступа,
/// отложенная инициализация и т.д.

// MARK: - Enums
enum AccessField {
    case basic
    case bankAccount
}

enum ProfileError: LocalizedError {
    case accessDenied

    var errorDescription: String? {
        switch self {
        case .accessDenied:
            return "Access is denied. Please enter a valid password"
        }
    }
}

// MARK: - Protocols
protocol ProfileService {
    typealias Success = (Profile) -> ()
    typealias Failure = (LocalizedError) -> ()
    func loadProfile(with fields: [AccessField], success: Success, failure: Failure)
}

// MARK: - Proxy
class ProfileProxy: ProfileService {

    private let keychain = Keychain()

    func loadProfile(with fields: [AccessField], success: Success, failure: Failure) {
        if let error = checkAccess(for: fields) {
            failure(error)
        } else {
            /// Note:
            /// At this point, the `success` and `failure` closures can be
            /// passed directly to the original service (as it is now) or
            /// expanded here to handle a result (for example, to cache).

            keychain.loadProfile(with: fields, success: success, failure: failure)
        }
    }

    private func checkAccess(for fields: [AccessField]) -> LocalizedError? {
        if fields.contains(.bankAccount) {
            switch BiometricsService.checkAccess() {
            case .authorized:
                return nil
            case .denied:
                return ProfileError.accessDenied
            }
        }

        return nil
    }
}

// MARK: - Real Keychain service
class Keychain: ProfileService {

    func loadProfile(with fields: [AccessField], success: Success, failure: Failure) {
        var profile = Profile()

        fields.forEach {
            switch $0 {
            case .basic:
                let info = loadBasicProfile()
                profile.firstName = info[Profile.Keys.firstName.raw]
                profile.lastName = info[Profile.Keys.lastName.raw]
                profile.email = info[Profile.Keys.email.raw]
            case .bankAccount:
                profile.bankAccount = loadBankAccount()
            }
        }

        success(profile)
    }

    private func loadBasicProfile() -> [String : String] {
        /// Gets these fields from a secure storage.
        return [Profile.Keys.firstName.raw : "Andrey",
                Profile.Keys.lastName.raw : "Sergey",
                Profile.Keys.email.raw : "andrey.sergey@gmail.com"]
    }

    private func loadBankAccount() -> BankAccount {
        /// Gets these fields from a secure storage.
        return BankAccount(id: 12345, amount: 999)
    }
}

class BiometricsService {

    enum Access {
        case authorized
        case denied
    }

    static func checkAccess() -> Access {
        /// The service uses Face ID, Touch ID or a plain old password to
        /// determine whether the current user is an owner of the device.

        /// Let's assume that in our example a user forgot a password :)
        return .denied
    }
}

struct Profile {

    enum Keys: String {
        case firstName
        case lastName
        case email
    }

    var firstName: String?
    var lastName: String?
    var email: String?
    var bankAccount: BankAccount?
}

struct BankAccount {
    var id: Int
    var amount: Double
}

// MARK: - Tests
class ProxyRealWorld: XCTestCase {

    func testProxyRealWorld() {
        debugPrint("Client: Loading a profile WITHOUT proxy")
        loadBasicProfile(with: Keychain())
        loadProfileWithBankAccount(with: Keychain())

        debugPrint("\nClient: Let's load a profile WITH proxy")
        loadBasicProfile(with: ProfileProxy())
        loadProfileWithBankAccount(with: ProfileProxy())
    }

    func loadBasicProfile(with service: ProfileService) {
        service.loadProfile(with: [.basic], success: { profile in
            debugPrint("Client: Basic profile is loaded")
        }) { error in
            debugPrint("Client: Cannot load a basic profile")
            debugPrint("Client: Error: " + error.localizedSummary)
        }
    }

    func loadProfileWithBankAccount(with service: ProfileService) {
        service.loadProfile(with: [.basic, .bankAccount], success: { profile in
            debugPrint("Client: Basic profile with a bank account is loaded")
        }) { error in
            debugPrint("Client: Cannot load a profile with a bank account")
            debugPrint("Client: Error: " + error.localizedSummary)
        }
    }
}

// MARK: - Extensions
extension RawRepresentable {
    var raw: Self.RawValue {
        return rawValue
    }
}

extension LocalizedError {
    var localizedSummary: String {
        return errorDescription ?? ""
    }
}
