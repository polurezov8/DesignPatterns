import XCTest

class Location: NSObject, NSCopying {
    var name: String
    var address: String

    init(name: String, address: String) {
        self.name = name
        self.address = address
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Location(name: self.name, address: self.address)
    }
}

class Appointment: NSObject, NSCopying {
    var name: String
    var day: String
    var place: Location

    init(name: String, day: String, place: Location) {
        self.name = name
        self.day = day
        self.place = place
    }

    func printDetails(label: String) {
        debugPrint("\(label) with \(name) on \(day) at \(place.name), " + "\(place.address)")
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return Appointment(name: self.name, day: self.day, place: self.place.copy() as! Location)
    }
}

private class SomeClientCode: XCTestCase {
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

