// MARK: - Protocols
// MARK: ExerciseCreatable
protocol ExerciseCreatable: class {
    func createExercise(type: Exercises) -> Exercisable
}

// MARK: Exercisable
protocol Exercisable: class {
    var name: String { get }
    func start()
    func stop()
}

// MARK: - Models
// MARK: Jumping
class Jumping: Exercisable {
    var name = "Jumping"

    func start() {
        debugPrint("Jumps started")
    }

    func stop() {
        debugPrint("Jumps stopped")
    }
}

// MARK: Squats
class Squats: Exercisable {
    var name = "Squats"

    func start() {
        debugPrint("Squats started")
    }

    func stop() {
        debugPrint("Squats stopped")
    }
}

// MARK: - Factory
// MARK: - Exercises
enum Exercises {
    case jumping
    case squarts
}

final class ExercisesFactory {
    // MARK: - Singleton instance
    static let defaultFactory = ExercisesFactory()

    // MARK: - Initialization
    private init() {
    }
}

// MARK: - ExerciseCreatable
extension ExercisesFactory: ExerciseCreatable {
    func createExercise(type: Exercises) -> Exercisable {
        switch type {
        case .jumping:
            return Jumping()
        case .squarts:
            return Squats()
        }
    }
}
