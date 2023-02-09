//
//  Coordinator.swift
//  Coordinator
//
//  Created by Sudipta Kumar Bhattacharjee on 03/02/23.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    func start()
    func eventOccurred(with type: Event)
}

protocol Coordinating {
    var coordinator: Coordinator? {get set}
}
