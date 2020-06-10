//
//  StateRealWorld.swift
//  State
//
//  Created by Dmitriy Polurezov on 10.06.2020.
//

import XCTest

protocol TrackingState {
    func startTracking()
    func stopTracking()
    func pauseTracking(for time: TimeInterval)
    func makeCheckIn()
    func findMyChildren()
}

class LocationTracker {

    /// Location tracking is enabled by default
    private lazy var trackingState: TrackingState = EnabledTrackingState(tracker: self)

    func startTracking() {
        trackingState.startTracking()
    }

    func stopTracking() {
        trackingState.stopTracking()
    }

    func pauseTracking(for time: TimeInterval) {
        trackingState.pauseTracking(for: time)
    }

    func makeCheckIn() {
        trackingState.makeCheckIn()
    }

    func findMyChildren() {
        trackingState.findMyChildren()
    }

    func update(state: TrackingState) {
        trackingState = state
    }
}

class EnabledTrackingState: TrackingState {

    private weak var tracker: LocationTracker?

    init(tracker: LocationTracker?) {
        self.tracker = tracker
    }

    func startTracking() {
        debugPrint("EnabledTrackingState: startTracking is invoked")
        debugPrint("EnabledTrackingState: tracking location....1")
        debugPrint("EnabledTrackingState: tracking location....2")
        debugPrint("EnabledTrackingState: tracking location....3")
    }

    func stopTracking() {
        debugPrint("EnabledTrackingState: Received 'stop tracking'")
        debugPrint("EnabledTrackingState: Changing state to 'disabled'...")
        tracker?.update(state: DisabledTrackingState(tracker: tracker))
        tracker?.stopTracking()
    }

    func pauseTracking(for time: TimeInterval) {
        debugPrint("EnabledTrackingState: Received 'pause tracking' for \(time) seconds")
        debugPrint("EnabledTrackingState: Changing state to 'disabled'...")
        tracker?.update(state: DisabledTrackingState(tracker: tracker))
        tracker?.pauseTracking(for: time)
    }

    func makeCheckIn() {
        debugPrint("EnabledTrackingState: performing check-in at the current location")
    }

    func findMyChildren() {
        debugPrint("EnabledTrackingState: searching for children...")
    }
}

class DisabledTrackingState: TrackingState {

    private weak var tracker: LocationTracker?

    init(tracker: LocationTracker?) {
        self.tracker = tracker
    }

    func startTracking() {
        debugPrint("DisabledTrackingState: Received 'start tracking'")
        debugPrint("DisabledTrackingState: Changing state to 'enabled'...")
        tracker?.update(state: EnabledTrackingState(tracker: tracker))
    }

    func pauseTracking(for time: TimeInterval) {
        debugPrint("DisabledTrackingState: Pause tracking for \(time) seconds")

        for i in 0...Int(time) {
            debugPrint("DisabledTrackingState: pause...\(i)")
        }

        debugPrint("DisabledTrackingState: Time is over")
        debugPrint("DisabledTrackingState: Returing to 'enabled state'...\n")
        self.tracker?.update(state: EnabledTrackingState(tracker: self.tracker))
        self.tracker?.startTracking()
    }

    func stopTracking() {
        debugPrint("DisabledTrackingState: Received 'stop tracking'")
        debugPrint("DisabledTrackingState: Do nothing...")
    }

    func makeCheckIn() {
        debugPrint("DisabledTrackingState: Received 'make check-in'")
        debugPrint("DisabledTrackingState: Changing state to 'enabled'...")
        tracker?.update(state: EnabledTrackingState(tracker: tracker))
        tracker?.makeCheckIn()
    }

    func findMyChildren() {
        debugPrint("DisabledTrackingState: Received 'find my children'")
        debugPrint("DisabledTrackingState: Changing state to 'enabled'...")
        tracker?.update(state: EnabledTrackingState(tracker: tracker))
        tracker?.findMyChildren()
    }
}

class StateRealWorld: XCTestCase {

    func test() {
        debugPrint("Client: I'm starting working with a location tracker")
        let tracker = LocationTracker()

        debugPrint()
        tracker.startTracking()

        debugPrint()
        tracker.pauseTracking(for: 2)

        debugPrint()
        tracker.makeCheckIn()

        debugPrint()
        tracker.findMyChildren()

        debugPrint()
        tracker.stopTracking()
    }
}
