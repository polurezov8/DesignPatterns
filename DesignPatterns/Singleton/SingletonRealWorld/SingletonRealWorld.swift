import Foundation
import XCTest

// MARK: - Logging
protocol Logging {
    func log(_ message: String)
}

extension Logging {
    func log(_ message: String) {
        Logger.shared.log(message)
    }
}

// MARK: - Logger
final class Logger {

    // MARK: Shared instance
    static let shared = Logger()

    // MARK: Life cycle
    private init() {}

    // MARK: Public methods
    public func log(_ message: String) {
        debugPrint(message)
    }
}

// MARK: - NSCopying
extension Logger: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

// MARK: - Tests
private class SingletonRealWorld: XCTestCase {
    func testSingletonRealWorld() {
        let firstInstance = Logger.shared
        let secondInstance = Logger.shared

        XCTAssertTrue(firstInstance === secondInstance)
    }
}
