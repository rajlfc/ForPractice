//
//  ViewController.swift
//  FBStreamAnimation
//
//  Created by Sudipta Kumar Bhattacharjee on 29/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let curvedView = CurvedView(frame: view.frame)
//        curvedView.backgroundColor = .yellow
//        view.addSubview(curvedView)
        
        
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        for i in 0...10 {
            generateAnimatedViews()
        }
    }
    
    func generateAnimatedViews() {
        let image = drand48() > 0.5 ? UIImage(named: "blue_like") : UIImage(named: "redheart")
        let imageView = UIImageView(image: image)
        let dimension = 20 + drand48()*10  /// drand48 gives a random number betwenn 0 to 1
        imageView.frame = CGRect(x: 0, y: 0, width: dimension, height: 30)
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 2 + drand48()*3 /// we are using random here to randomize the animation of symbols for a static value it will always mantain the same y position
        
        /// The next two lines because after like animation the like symbol was going to top
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        imageView.layer.add(animation, forKey: nil)
        
        view.addSubview(imageView)
    }


}

func customPath() -> UIBezierPath {
    let path = UIBezierPath()
    
    path.move(to: CGPoint(x: 0, y: 200))
    let endPoint = CGPoint(x: 400, y: 200)
    let randomYShoft = 200 + drand48()*300
    let cp1 = CGPoint(x: 100, y: 100-randomYShoft)
    let cp2 = CGPoint(x: 200, y: 300+randomYShoft)
    path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    return path
}

class CurvedView: UIView {
    override func draw(_ rect: CGRect) {
        let path = customPath()
        path.lineWidth = 3
        path.stroke()
        
    }
}

