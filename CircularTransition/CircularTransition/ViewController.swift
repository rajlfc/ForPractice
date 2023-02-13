//
//  ViewController.swift
//  CircularTransition
//
//  Created by Sudipta Kumar Bhattacharjee on 28/12/22.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet weak var menuButton: UIButton!
    let transition = CircularTransition()
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.layer.cornerRadius = menuButton.frame.size.width/2
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }


}

