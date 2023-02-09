//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Sudipta Kumar Bhattacharjee on 03/02/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func eventOccurred(with type: Event) {
        
    }
    
    
}
