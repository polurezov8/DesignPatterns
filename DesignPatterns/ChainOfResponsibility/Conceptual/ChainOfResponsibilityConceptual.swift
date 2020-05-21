/// Паттерн Цепочка обязанностей
///
/// Назначение: Позволяет передавать запросы последовательно по цепочке
/// обработчиков. Каждый последующий обработчик решает, может ли он обработать
/// запрос сам и стоит ли передавать запрос дальше по цепи.

import XCTest

/// Интерфейс Обработчика объявляет метод построения цепочки обработчиков. Он
/// также объявляет метод для выполнения запроса.
protocol ConceptualHandler: class {
    var nextHandler: ConceptualHandler? { get set }

    @discardableResult
    func setNext(handler: ConceptualHandler) -> ConceptualHandler
    func handle(request: String) -> String?
}

extension ConceptualHandler {
    func setNext(handler: ConceptualHandler) -> ConceptualHandler {
        self.nextHandler = handler

        /// Возврат обработчика отсюда позволит связать обработчики простым
        /// способом, вот так:
        /// monkey.setNext(handler: squirrel).setNext(handler: dog)
        return handler
    }

    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
}

/// Все Конкретные Обработчики либо обрабатывают запрос, либо передают его
/// следующему обработчику в цепочке.
class MonkeyHandler: ConceptualHandler {
    var nextHandler: ConceptualHandler?

    func handle(request: String) -> String? {
        return request == "Banana" ? "Monkey: I'll eat the " + request + ".\n" : nextHandler?.handle(request: request)
    }
}

class SquirrelHandler: ConceptualHandler {
    var nextHandler: ConceptualHandler?

    func handle(request: String) -> String? {
        return request == "Nut" ? "Squirrel: I'll eat the " + request + ".\n" : nextHandler?.handle(request: request)
    }
}

class DogHandler: ConceptualHandler {
    var nextHandler: ConceptualHandler?

    func handle(request: String) -> String? {
        return request == "MeatBall" ? "Dog: I'll eat the " + request + ".\n" : nextHandler?.handle(request: request)
    }
}

/// Обычно клиентский код приспособлен для работы с единственным обработчиком. В
/// большинстве случаев клиенту даже неизвестно, что этот обработчик является
/// частью цепочки.
class Client {
    // ...
    static func someClientCode(handler: ConceptualHandler) {
        let food = ["Nut", "Banana", "Cup of coffee"]
        food.forEach { item in
            debugPrint("Client: Who wants a " + item + "?\n")

            guard let result = handler.handle(request: item) else {
                debugPrint("  " + item + " was left untouched.\n")
                return
            }

            debugPrint("  " + result)
        }
    }
    // ...
}

/// Давайте посмотрим как всё это будет работать.
class ChainOfResponsibilityConceptual: XCTestCase {
 
    func test() {
        /// Другая часть клиентского кода создает саму цепочку.
        let monkey = MonkeyHandler()
        let squirrel = SquirrelHandler()
        let dog = DogHandler()
        monkey.setNext(handler: squirrel).setNext(handler: dog)

        /// Клиент должен иметь возможность отправлять запрос любому
        /// обработчику, а не только первому в цепочке.
        debugPrint("Chain: Monkey > Squirrel > Dog\n\n")
        Client.someClientCode(handler: monkey)
        debugPrint()
        debugPrint("Subchain: Squirrel > Dog\n\n")
        Client.someClientCode(handler: squirrel)
    }
}

