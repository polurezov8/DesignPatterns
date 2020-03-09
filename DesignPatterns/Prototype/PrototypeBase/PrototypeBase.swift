// MARK: - Copyable
public protocol Copyable {
    init(_ prototype: Self)
}

// MARK: - Cope method implementation
extension Copyable {
    public func copy() -> Self {
        return type(of: self).init(self)
    }
}

// MARK: - Deep copy implemetation
extension Array where Element: Copyable {
    public func deepCopy() -> [Element] {
        return map { $0.copy() }
    }
}
