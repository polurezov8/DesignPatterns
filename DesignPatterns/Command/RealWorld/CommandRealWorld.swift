//
//  CommandRealWorld.swift
//  Command
//
//  Created by Dmitriy Polurezov on 28.05.2020.
//

import XCTest

class CommandRealLife {

    // MARK: - Receiver
    public class Door {
        public var isOpen = false
    }

    // MARK: - Command
    public class DoorCommand {
        public let door: Door

        public init(_ door: Door) {
            self.door = door
        }

        public func execute() { }
    }

    public class OpenCommand: DoorCommand {
        public override func execute() {
            debugPrint("opening the door...")
            door.isOpen = true
        }
    }

    public class CloseCommand: DoorCommand {
        public override func execute() {
            debugPrint("closing the door...")
            door.isOpen = false
        }
    }

    // MARK: - Invoker
    public class Doorman {

        public let commands: [DoorCommand]
        public let door: Door

        public init(door: Door) {
            let commandCount = arc4random_uniform(10) + 1
            self.commands = (0 ..< commandCount).map { index in
                return index % 2 == 0 ? OpenCommand(door) : CloseCommand(door)
            }

            self.door = door
        }

        public func execute() {
            debugPrint("Doorman is...")
            commands.forEach { $0.execute() }
        }
    }

    // MARK: - Example
    class CommandRealLifeTests: XCTestCase {

        func test() {
            let isOpen = true

            debugPrint("You predict the door will be " + "\(isOpen ? "open" : "closed").")
            debugPrint("")

            let door = Door()
            let doorman = Doorman(door: door)
            doorman.execute()
            debugPrint("")

            door.isOpen == isOpen ? debugPrint("You were right! :]") : debugPrint("You were wrong :[")

            debugPrint("The door is \(door.isOpen ? "open" : "closed").")
        }
    }
}

