//
//  UIViewExtensions.swift
//  Movies
//
//  Created by Aral Benli on 6.12.2023.
//

import Foundation
import UIKit

extension UIView {
    func round(_ radious : CGFloat = 10
    ){
        self.layer.cornerRadius = radious
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor , windth : CGFloat){
        self.layer.borderWidth = windth
        self.layer.borderColor = color.cgColor
    }
}
