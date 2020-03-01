// MARK: - Protocols
protocol Sofable {
    var name: String { get }
    var type: String { get }
}

protocol Chairable {
    var name: String { get }
    var type: String { get }
}

protocol BaseAbstractFactory {
    func createChair() -> Chairable
    func createSofa() -> Sofable
}

// MARK: - Models
// MARK: Bedroom
struct BedroomSofa: Sofable {
    var name = "Sofa"
    var type = "Sofa for bedroom"
}

struct BedroomChair: Chairable {
    var name = "Chair"
    var type = "Chair for bedroom"
}

// MARK: Kitchen
struct KitchenSofa: Sofable {
    var name = "Sofa"
    var type = "Sofa for kitchen"
}

struct KitchenChair: Chairable {
    var name = "Chair"
    var type = "Chair for kitchen"
}

// MARK: - Factories
struct BedroomFactory: BaseAbstractFactory {
    func createChair() -> Chairable {
        return BedroomChair()
    }

    func createSofa() -> Sofable {
        return BedroomSofa()
    }
}

struct KitchenFactory: BaseAbstractFactory {
    func createChair() -> Chairable {
        return KitchenChair()
    }

    func createSofa() -> Sofable {
        return KitchenSofa()
    }
}
