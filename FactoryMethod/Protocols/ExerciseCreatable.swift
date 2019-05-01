//
//  ExerciseCreatable.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

protocol ExerciseCreatable: class {
    func createExercise(type: Exercises) -> Exercisable
}
