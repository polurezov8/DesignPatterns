//
//  Squats.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

class Squats: Exercisable {
    var name = "Squats"

    func start() {
        debugPrint("Squats started")
    }

    func stop() {
        debugPrint("Squats stopped")
    }
}
