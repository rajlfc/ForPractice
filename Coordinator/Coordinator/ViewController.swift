//
//  ViewController.swift
//  Coordinator
//
//  Created by Sudipta Kumar Bhattacharjee on 03/02/23.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        title = "Home"
    }


}

