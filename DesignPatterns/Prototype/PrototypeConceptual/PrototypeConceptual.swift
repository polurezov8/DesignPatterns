import Foundation
import XCTest

/// Паттерн Прототип
///
/// Назначение: Позволяет копировать объекты, не вдаваясь в подробности их
/// реализации.
/// Swift имеет встроенную поддержку клонирования. Чтобы сделать класс
/// клонируемым, вам нужно реализовать в нём протокол NSCopying, а именно метод
/// `copy`.
class BaseClass: NSCopying, Equatable {
    private var intValue = 1
    private var stringValue = "Value"

    required init(intValue: Int = 1, stringValue: String = "Value") {
        self.intValue = intValue
        self.stringValue = stringValue
    }

    // MARK: - NSCopying
    func copy(with zone: NSZone? = nil) -> Any {
        let prototype = type(of: self).init()
        prototype.intValue = intValue
        prototype.stringValue = stringValue
        debugPrint("Values defined in BaseClass have been cloned!")
        return prototype
    }

    // MARK: - Equatable
    static func ==(lhs: BaseClass, rhs: BaseClass) -> Bool {
        return lhs.intValue == rhs.intValue && lhs.stringValue == rhs.stringValue
    }
}

/// Подклассы могет переопределять базовый метод `copy`, чтобы дополнительно
/// скопировать данные собственного класса. Но в этом случае всегда сперва
/// вызывайте родительскую реализацию метод копирования.
class SubClass: BaseClass {

    private var boolValue = true

    func copy() -> Any {
        return copy(with: nil)
    }

    override func copy(with zone: NSZone?) -> Any {
        guard let prototype = super.copy(with: zone) as? SubClass else {
            return SubClass() // oops
        }

        prototype.boolValue = boolValue
        debugPrint("Values defined in SubClass have been cloned!")
        return prototype
    }
}

/// Клиентский код.
private class PrototypeClient: XCTestCase {
    func testSomeClientCode() {
        let original = SubClass(intValue: 2, stringValue: "Value2")

        guard let copy = original.copy() as? SubClass else {
            XCTAssert(false)
            return
        }

        /// См. реализацию протокола `Equatable`.
        XCTAssertTrue(copy == original)
        debugPrint("The original object is equal to the copied object!")
    }
}
