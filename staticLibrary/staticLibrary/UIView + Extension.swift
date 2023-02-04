//
//  UIView + Extension.swift
//  staticLibrary
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import Foundation
import UIKit

extension UIView {
    func cornerRadius() {
        self.backgroundColor = .random
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.random.cgColor
        self.clipsToBounds = true
    }
}
