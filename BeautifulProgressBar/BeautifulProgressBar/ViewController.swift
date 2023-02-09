//
//  ViewController.swift
//  BeautifulProgressBar
//
//  Created by Sudipta Kumar Bhattacharjee on 03/01/23.
//

import UIKit
import JGProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.showExample()
        })
    }

    func showExample() {
        let hud = JGProgressHUD()
        hud.indicatorView = JGProgressHUDPieIndicatorView()
        //hud.textLabel.text = "Success"
        hud.textLabel.text = "Downloading"
        //hud.detailTextLabel.text = "Please wait"
        hud.detailTextLabel.text = "0%"
        hud.show(in: view)
        
        var progress: Float = 0.0
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            progress += 0.1
            hud.setProgress(progress, animated: true)
            let value: Float = progress / 1.0
            hud.detailTextLabel.text = "\(Int(value*100))%"
            if progress > 1.0 {
                timer.invalidate()
                
                hud.indicatorView = JGProgressHUDSuccessIndicatorView()
                hud.textLabel.text = "Done"
                hud.detailTextLabel.text = nil
                hud.dismiss(afterDelay: 6)
            }
        }
    }

}

