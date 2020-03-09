import XCTest

// MARK: - Location
final class Location: NSObject, NSCopying {

    // MARK: - Properties
    public var name: String
    public var address: String

    // MARK: - Life cycle
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }

    // MARK: - Public methods
    public func copy(with zone: NSZone? = nil) -> Any {
        return Location(name: self.name, address: self.address)
    }
}

// MARK: - Appointment
final class Appointment: NSObject, NSCopying {

    // MARK: - Properties
    public var name: String
    public var day: String
    public var place: Location

    // MARK: - Life cycle
    init(name: String, day: String, place: Location) {
        self.name = name
        self.day = day
        self.place = place
    }

    // MARK: - Public methods
    public func printDetails(label: String) {
        debugPrint("\(label) with \(name) on \(day) at \(place.name), " + "\(place.address)")
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        return Appointment(name: self.name, day: self.day, place: self.place.copy() as! Location)
    }
}

// MARK: - Tests
private class PrototypeRealWorld: XCTestCase {
    func testDeepCopy() {
        let beerMeeting = Appointment(name: "Bob", day: "Mon", place: Location(name: "Joe's Bar", address: "123 Main St"))
        let workMeeting = beerMeeting.copy() as! Appointment

        workMeeting.name = "Alice"
        workMeeting.day = "Fri"
        workMeeting.place.name = "Conference Rm 2"
        workMeeting.place.address = "Company HQ"

        beerMeeting.printDetails(label: "Social")
        workMeeting.printDetails(label: "Work")

        XCTAssertFalse(beerMeeting.place === workMeeting.place)
    }
}

