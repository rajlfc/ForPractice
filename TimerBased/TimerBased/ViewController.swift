//
//  ViewController.swift
//  TimerBased
//
//  Created by Sudipta Kumar Bhattacharjee on 30/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(printLine), userInfo: nil, repeats: true)
    }
    
    @objc func printLine() {
        print("Timer going")
        timer.invalidate()
    }
    
}

