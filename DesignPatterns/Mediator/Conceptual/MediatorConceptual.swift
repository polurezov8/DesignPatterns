//
//  MediatorConceptual.swift
//  Mediator
//
//  Created by Dmitriy Polurezov on 03.06.2020.
//

/// Паттерн Посредник
///
/// Назначение: Позволяет уменьшить связанность множества классов между собой,
/// благодаря перемещению этих связей в один класс-посредник.

import XCTest

/// Интерфейс Посредника предоставляет метод, используемый компонентами для
/// уведомления посредника о различных событиях. Посредник может реагировать на
/// эти события и передавать исполнение другим компонентам.
protocol Mediator: AnyObject {
    func notify(sender: ComponentType, event: Event)
}

/// Перечисление с возможными видами событий.
enum Event {
    case a
    case b
    case c
    case d
}

/// Конкретные Посредники реализуют совместное поведение, координируя отдельные
/// компоненты.
class ConcreteMediator: Mediator {

    private var component1: Component1
    private var component2: Component2

    init(_ component1: Component1, _ component2: Component2) {
        self.component1 = component1
        self.component2 = component2

        component1.update(mediator: self)
        component2.update(mediator: self)
    }

    func notify(sender: ComponentType, event: Event) {
        switch event {
        case .a:
            debugPrint("Mediator reacts on A and triggers following operations:")
            self.component1.doA()
        case .b:
            debugPrint("Mediator reacts on B and triggers following operations:")
            self.component1.doB()
        case .c:
            debugPrint("Mediator reacts on C and triggers following operations:")
            self.component2.doC()
        case .d:
            debugPrint("Mediator reacts on D and triggers following operations:")
            self.component2.doD()
        }
    }
}

/// Интерфейс Компонента описывает базовую функциональность хранения и обновления экземпляра
/// посредника внутри объектов компонентов.
protocol ComponentType {
    var mediator: Mediator? { get }
    func update(mediator: Mediator)
}

/// Конкретные Компоненты реализуют различную функциональность. Они не зависят
/// от других компонентов. Они также не зависят от каких-либо конкретных классов
/// посредников.
class Component1: ComponentType {

    var mediator: Mediator?

    init(mediator: Mediator? = nil) {
        self.mediator = mediator
    }

    func update(mediator: Mediator) {
        self.mediator = mediator
    }

    func doA() {
        debugPrint("Component 1 does A.")
        mediator?.notify(sender: self, event: .a)
    }

    func doB() {
        debugPrint("Component 1 does B.\n")
        mediator?.notify(sender: self, event: .b)
    }
}

class Component2: ComponentType {

    var mediator: Mediator?

    init(mediator: Mediator? = nil) {
        self.mediator = mediator
    }

    func update(mediator: Mediator) {
        self.mediator = mediator
    }

    func doC() {
        debugPrint("Component 2 does C.")
        mediator?.notify(sender: self, event: .c)
    }

    func doD() {
        debugPrint("Component 2 does D.")
        mediator?.notify(sender: self, event: .d)
    }
}

/// Давайте посмотрим как всё это будет работать.
class MediatorConceptual: XCTestCase {

    func testMediatorConceptual() {
        let component1 = Component1()
        let component2 = Component2()

        let mediator = ConcreteMediator(component1, component2)
        debugPrint("Client triggers operation A.")
        component1.doA()

        debugPrint("\nClient triggers operation D.")
        component2.doD()

        debugPrint(mediator)
    }
}
