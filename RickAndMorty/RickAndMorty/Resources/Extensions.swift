//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Sudipta Kumar Bhattacharjee on 07/01/23.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
