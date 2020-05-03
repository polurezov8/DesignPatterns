// MARK: - Protocols
protocol CostHaving {
    var cost: Double { get }
}

protocol IngredientsHaving {
    var ingredients: [String] { get }
}

protocol BeverageHaving: BeverageDataHaving {
    var beverage: BeverageDataHaving { get }
}

typealias BeverageDataHaving = CostHaving & IngredientsHaving

// MARK: - Models
struct SimpleCoffee: BeverageDataHaving {
    let cost: Double = 1.0
    let ingredients = ["Water", "Coffee"]
}

struct Milk: BeverageHaving {

    let beverage: BeverageDataHaving

    var cost: Double {
        return beverage.cost + 0.5
    }

    var ingredients: [String] {
        return beverage.ingredients + ["Milk"]
    }
}

struct WhipCoffee: BeverageHaving {

    let beverage: BeverageDataHaving

    var cost: Double {
        return beverage.cost + 0.5
    }

    var ingredients: [String] {
        return beverage.ingredients + ["Whip"]
    }
}

// MARK: - Client code
class ClientBase {

    func clientCode() {
        var someCoffee: BeverageDataHaving = SimpleCoffee()
        debugPrint("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")

        someCoffee = Milk(beverage: someCoffee)
        debugPrint("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
        
        someCoffee = WhipCoffee(beverage: someCoffee)
        debugPrint("Cost: \(someCoffee.cost); Ingredients: \(someCoffee.ingredients)")
    }
}

