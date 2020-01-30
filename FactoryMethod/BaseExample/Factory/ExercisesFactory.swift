//
//  ExercisesFactory.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

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
            return Squarts()
        }
    }
}
