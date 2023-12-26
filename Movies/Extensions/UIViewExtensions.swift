//
//  UIViewExtensions.swift
//  Movies
//
//  Created by Aral Benli on 6.12.2023.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radious : CGFloat = 10) {
        layer.cornerRadius = radious
        clipsToBounds = true
    }
    
    func addBorder(color: UIColor , windth : CGFloat) {
        layer.borderWidth = windth
        layer.borderColor = color.cgColor
    }
}
