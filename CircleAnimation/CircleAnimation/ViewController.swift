//
//  ViewController.swift
//  CircleAnimation
//
//  Created by Sudipta Kumar Bhattacharjee on 29/11/22.
//

import UIKit

class ViewController: UIViewController {
//    let shapeLayer = CAShapeLayer()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        let center = view.center
//
//        // create my track layer
//        let trackLayer = CAShapeLayer()
//        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
//        trackLayer.path = circularPath.cgPath
//        trackLayer.strokeColor = UIColor.lightGray.cgColor
//        trackLayer.lineWidth = 10
//        trackLayer.fillColor = UIColor.clear.cgColor
//        trackLayer.lineCap = CAShapeLayerLineCap.round
//        view.layer.addSublayer(trackLayer)
//
//        shapeLayer.path = circularPath.cgPath
//        shapeLayer.strokeColor = UIColor.red.cgColor
//        shapeLayer.lineWidth = 10
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineCap = CAShapeLayerLineCap.round
//        shapeLayer.strokeEnd = 0
//        view.layer.addSublayer(shapeLayer)
//
//        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
//    }
//
//    @objc func handleTap() {
//
//        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
//        basicAnimation.toValue = 1
//        basicAnimation.duration = 2
//        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
//        basicAnimation.isRemovedOnCompletion = false // if we remove this line after the circular animation, the red circular will be removed
//        shapeLayer.add(basicAnimation, forKey: "basic")
//    }
    
    
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let center = view.center
        let trackLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -Double.pi/2, endAngle: Double.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.lineWidth = 10
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineWidth = 10
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc func handleTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeend")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = .forwards
        shapeLayer.add(basicAnimation, forKey: "basic")
    }


}

