import Foundation

// MARK: - Protocols
protocol DomainModel { }

protocol QueryBuilder {
    associatedtype Model: DomainModel
    typealias Predicate = (Model) -> (Bool)

    func limit(_ limit: Int) -> Self
    func filter(_ predicate: @escaping Predicate) -> Self
    func fetch() -> [Model]
}

// MARK: - Models
private struct User: DomainModel {
    let id: Int
    let age: Int
    let email: String
}

class RealmQueryBuilder<Model: DomainModel>: QueryBuilder {

    // MARK: Query
    enum Query {
        case filter(Predicate)
        case limit(Int)
    }

    // MARK: Properties
    private var operations = [Query]()

    // MARK: - QueryBuilder
    func limit(_ limit: Int) -> Self {
        operations.append(Query.limit(limit))
        return self
    }

    func filter(_ predicate: @escaping (Model) -> Bool) -> Self {
        operations.append(Query.filter(predicate))
        return self
    }

    func fetch() -> [Model] {
        debugPrint("RealmQueryBuilder: Initializing CoreDataProvider with \(operations.count) operations:")
        return RealmProvider().fetch(operations)
    }
}

class CoreDataQueryBuilder<Model: DomainModel>: QueryBuilder {

    // MARK: Query
    enum Query {
        case filter(Predicate)
        case limit(Int)
        case includesPropertyValues(Bool)
    }

    // MARK: Properties
    private var operations = [Query]()

    // MARK: - QueryBuilder
    func limit(_ limit: Int) -> Self {
        operations.append(Query.limit(limit))
        return self
    }

    func filter(_ predicate: @escaping (Model) -> Bool) -> Self {
        operations.append(Query.filter(predicate))
        return self
    }

    func fetch() -> [Model] {
        debugPrint("CoreDataQueryBuilder: Initializing CoreDataProvider with \(operations.count) operations.")
        return CoreDataProvider().fetch(operations)
    }

    func includesPropertyValues(_ toggle: Bool) -> CoreDataQueryBuilder<Model> {
        operations.append(Query.includesPropertyValues(toggle))
        return self
    }
}


/// Data Providers contain a logic how to fetch models. Builders accumulate
/// operations and then update providers to fetch the data.
class RealmProvider {

    func fetch<Model: DomainModel>(_ operations: [RealmQueryBuilder<Model>.Query]) -> [Model] {
        debugPrint("RealmProvider: Retrieving data from Realm...")
        operations.forEach {
            switch $0 {
            case .filter(_):
                debugPrint("RealmProvider: executing the 'filter' operation.")
                /// Use Realm instance to filter results.
                break
            case .limit(_):
                debugPrint("RealmProvider: executing the 'limit' operation.")
                /// Use Realm instance to limit results.
                break
            }
        }

        /// Return results from Realm
        return []
    }
}

class CoreDataProvider {

    func fetch<Model: DomainModel>(_ operations: [CoreDataQueryBuilder<Model>.Query]) -> [Model] {

        /// Create a NSFetchRequest
        debugPrint("CoreDataProvider: Retrieving data from CoreData...")
        operations.forEach {
            switch $0 {
            case .filter(_):
                debugPrint("CoreDataProvider: executing the 'filter' operation.")
                /// Set a 'predicate' for a NSFetchRequest.
                break
            case .limit(_):
                debugPrint("CoreDataProvider: executing the 'limit' operation.")
                /// Set a 'fetchLimit' for a NSFetchRequest.
                break
            case .includesPropertyValues(_):
                debugPrint("CoreDataProvider: executing the 'includesPropertyValues' operation.")
                /// Set an 'includesPropertyValues' for a NSFetchRequest.
                break
            }
        }

        /// Execute a NSFetchRequest and return results.
        return []
    }
}
