// MARK: - Protocols
protocol Switch {
    var appliance: Appliance { get set }
    func turnOn()
}

protocol Appliance {
    func run()
}

// MARK: - Models
final class RemoteControl: Switch {

    var appliance: Appliance

    func turnOn() {
        self.appliance.run()
    }

    init(appliance: Appliance) {
        self.appliance = appliance
    }
}

final class TV: Appliance {

    func run() {
        print("tv turned on");
    }
}

final class VacuumCleaner: Appliance {

    func run() {
        print("vacuum cleaner turned on")
    }
}

// MARK: - Client code
class ClientCode {

    func useTVRemoteControl() {
        let tvRemoteControl = RemoteControl(appliance: TV())
        tvRemoteControl.turnOn()
    }

    func useFancyVacuumCleanerRemoteControl() {
        let fancyVacuumCleanerRemoteControl = RemoteControl(appliance: VacuumCleaner())
        fancyVacuumCleanerRemoteControl.turnOn()
    }
}

