/// Паттерн Абстрактная Фабрика
///
/// Назначение: Предоставляет интерфейс для создания семейств связанных или
/// зависимых объектов без привязки к их конкретным классам.
/// Интерфейс Абстрактной Фабрики объявляет набор методов, которые возвращают
/// различные абстрактные продукты. Эти продукты называются семейством и связаны
/// темой или концепцией высокого уровня. Продукты одного семейства обычно могут
/// взаимодействовать между собой. Семейство продуктов может иметь несколько
/// вариаций, но продукты одной вариации несовместимы с продуктами другой.
protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

/// Каждый отдельный продукт семейства продуктов должен иметь базовый интерфейс.
/// Все вариации продукта должны реализовывать этот интерфейс.
protocol AbstractProductA {
    func usefulFunctionA() -> String
}

/// Базовый интерфейс другого продукта. Все продукты могут взаимодействовать
/// друг с другом, но правильное взаимодействие возможно только между продуктами
/// одной и той же конкретной вариации.
protocol AbstractProductB {

    /// Продукт B способен работать самостоятельно...
    func usefulFunctionB() -> String

    /// ...а также взаимодействовать с Продуктами Б той же вариации.
    ///
    /// Абстрактная Фабрика гарантирует, что все продукты, которые она создает,
    /// имеют одинаковую вариацию и, следовательно, совместимы.
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String
}

/// Конкретная Фабрика производит семейство продуктов одной вариации. Фабрика
/// гарантирует совместимость полученных продуктов. Обратите внимание, что
/// сигнатуры методов Конкретной Фабрики возвращают абстрактный продукт, в то
/// время как внутри метода создается экземпляр конкретного продукта.
class ConcreteFactory1: AbstractFactory {

    func createProductA() -> AbstractProductA {
        return ConcreteProductA1()
    }

    func createProductB() -> AbstractProductB {
        return ConcreteProductB1()
    }
}

/// Каждая Конкретная Фабрика имеет соответствующую вариацию продукта.
class ConcreteFactory2: AbstractFactory {

    func createProductA() -> AbstractProductA {
        return ConcreteProductA2()
    }

    func createProductB() -> AbstractProductB {
        return ConcreteProductB2()
    }
}

/// Конкретные продукты создаются соответствующими Конкретными Фабриками.
class ConcreteProductA1: AbstractProductA {

    func usefulFunctionA() -> String {
        return "The result of the product A1."
    }
}

class ConcreteProductA2: AbstractProductA {

    func usefulFunctionA() -> String {
        return "The result of the product A2."
    }
}

/// Конкретные Продукты создаются соответствующими Конкретными Фабриками.
class ConcreteProductB1: AbstractProductB {

    func usefulFunctionB() -> String {
        return "The result of the product B1."
    }

    /// Продукт B1 может корректно работать только с Продуктом A1. Тем не менее,
    /// он принимает любой экземпляр Абстрактного Продукта А в качестве
    /// аргумента.
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B1 collaborating with the (\(result))"
    }
}

class ConcreteProductB2: AbstractProductB {

    func usefulFunctionB() -> String {
        return "The result of the product B2."
    }

    /// Продукт B2 может корректно работать только с Продуктом A2. Тем не менее,
    /// он принимает любой экземпляр Абстрактного Продукта А в качестве
    /// аргумента.
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B2 collaborating with the (\(result))"
    }
}

/// Клиентский код работает с фабриками и продуктами только через абстрактные
/// типы: Абстрактная Фабрика и Абстрактный Продукт. Это позволяет передавать
/// любой подкласс фабрики или продукта клиентскому коду, не нарушая его.
class AbstractFactoryClient {

    static func someClientCode(factory: AbstractFactory) {
        let productA = factory.createProductA()
        let productB = factory.createProductB()

        debugPrint(productB.usefulFunctionB())
        debugPrint(productB.anotherUsefulFunctionB(collaborator: productA))
    }
}
