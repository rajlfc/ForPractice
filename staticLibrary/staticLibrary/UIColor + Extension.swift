//
//  UIColor + Extension.swift
//  staticLibrary
//
//  Created by Sudipta Kumar Bhattacharjee on 01/02/23.
//

import Foundation
import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
