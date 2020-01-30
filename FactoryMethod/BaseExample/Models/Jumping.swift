//
//  Jumping.swift
//  
//
//  Created by Dmitriy Poluriezov on 5/1/19.
//

import Foundation

class Jumping: Exercisable {
    var name = "Jumping"

    func start() {
        debugPrint("Jumps started")
    }

    func stop() {
        debugPrint("Jumps stopped")
    }
}
