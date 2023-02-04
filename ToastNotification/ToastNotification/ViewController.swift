//
//  ViewController.swift
//  ToastNotification
//
//  Created by Sudipta Kumar Bhattacharjee on 02/02/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.showToast(message: "Hey toast this is it", font: .systemFont(ofSize: 12))
    }


}

extension UIViewController {

func showToast(message : String, font: UIFont) {

    let toastLabel = UILabel(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.height + self.navigationController!.navigationBar.frame.minY, width: view.bounds.size.width, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.font = font
    toastLabel.textAlignment = .center
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
        toastLabel.center.y = self.navigationController!.navigationBar.frame.height + self.navigationController!.navigationBar.frame.minY
        self.view.layoutIfNeeded()
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}
    
}

