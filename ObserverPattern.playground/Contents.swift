import UIKit
import Foundation

var greeting = "Hello, playground"

struct TrafficColor {
    static let red = "red"
    static let green = "green"
    static let yellow = "yellow"
}

protocol ObserverProtocol {
    var id: Int {get set}
    func onTrafficLightColorChange(_ color: String)
}

class VehicleObserver: ObserverProtocol {
    var id: Int
    init(id: Int) {
        self.id = id
    }
    
    func onTrafficLightColorChange(_ color: String) {
        if (color == TrafficColor.red) {
            print("stop")
        }
        if color == TrafficColor.green {
            print("go")
        }
        if color == TrafficColor.yellow {
            print("slow")
        }
    }
    
}

class VendorObserver: ObserverProtocol {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func onTrafficLightColorChange(_ color: String) {
        if (color == TrafficColor.red) {
            print("sell")
        }
        if color == TrafficColor.green {
            print("move aside")
        }
    }
}

class TrafficLightSubject {
    private var color = String()
    var trafficLightColor: String {
        get {
            return color
        } set {
            color = newValue
            notifyObserver()
        }
    }
    
    private var trafficVehicleObserver = [ObserverProtocol]()
    func addObserver(_ observer: ObserverProtocol) {
        guard trafficVehicleObserver.contains(where: {$0.id == observer.id}) == false else {
            return
        }
        trafficVehicleObserver.append(observer)
    }
    
    func removeObserver(_ observer: ObserverProtocol) {
        trafficVehicleObserver = trafficVehicleObserver.filter({$0.id != observer.id})
    }
    
    private func notifyObserver() {
        trafficVehicleObserver.forEach({$0.onTrafficLightColorChange(color)})
    }
    
    deinit {
        trafficVehicleObserver.removeAll()
    }
}

let trafficLightSubject = TrafficLightSubject()
let vehicleObserver = VehicleObserver(id: 1)
let vendorObserver = VendorObserver(id: 2)

trafficLightSubject.addObserver(vehicleObserver)
trafficLightSubject.addObserver(vendorObserver)
trafficLightSubject.trafficLightColor = TrafficColor.red
trafficLightSubject.removeObserver(vendorObserver)
trafficLightSubject.trafficLightColor = TrafficColor.green


/// The id we have added in protocol because to avoid adding same observer multiple times from other places.
