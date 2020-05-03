// MARK: - Protocols
protocol Shape {
    func draw(fillColor: String)
}

// MARK: - Models
final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a Square with color \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

// MARK: - Composite
final class Whiteboard: Shape {

    private lazy var shapes = [Shape]()

    init(_ shapes: Shape...) {
        self.shapes = shapes
    }

    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

// MARK: - Client code
class ClientCode {

    func someClientCode() {
        let whiteboard = Whiteboard(Circle(), Square())
        whiteboard.draw(fillColor: "Red")
    }
}
