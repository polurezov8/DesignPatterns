//
//  GenericCommandExample.swift
//  Command
//
//  Created by Dmitriy Polurezov on 28.05.2020.
//

import Foundation

protocol GenericCommandType {
    func execute()
}

class GenericCommand<T>: GenericCommandType {

    private var receiver: T
    private var instructions: (T) -> Void

    init(receiver:T, instructions: @escaping (T) -> Void) {
        self.receiver = receiver
        self.instructions = instructions
    }

    func execute() {
        instructions(receiver)
    }
}
