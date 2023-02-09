//
//  RoundedCornerView.swift
//  Cornerradius
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import UIKit

@IBDesignable
class RoundedCornerView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
