/// Паттерн Одиночка
///
/// Назначение: Гарантирует, что у класса есть только один экземпляр, и
/// предоставляет к нему глобальную точку доступа.

import XCTest

/// Класс Одиночка предоставляет поле `shared`, которое позволяет клиентам
/// получать доступ к уникальному экземпляру одиночки.
final class Singleton {

    /// Статическое поле, управляющие доступом к экземпляру одиночки.
    /// Эта реализация позволяет вам расширять класс Одиночки, сохраняя повсюду
    /// только один экземпляр каждого подкласса.
    static let shared = Singleton()

    /// Инициализатор Одиночки всегда должен быть скрытым, чтобы предотвратить
    /// прямое создание объекта через инициализатор.
    private init() {}

    /// Наконец, любой одиночка должен содержать некоторую бизнес-логику,
    /// которая может быть выполнена на его экземпляре.
    public func someBusinessLogic() -> String {
        return "Result of the 'someBusinessLogic' call"
    }
}

/// Одиночки не должны быть клонируемыми.
extension Singleton: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

/// Клиентский код.
private class SingletonConceptual: XCTestCase {
    func testSingletonConceptual() {
        let firstInstance = Singleton.shared
        let secondInstance = Singleton.shared

        XCTAssertTrue(firstInstance === secondInstance)
    }
}
