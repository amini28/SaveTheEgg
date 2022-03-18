//
//  Extension.swift
//  Save The Egg
//
//  Created by Amini on 05/03/22.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16 ) / 255.0
        let g = CGFloat((hex & 0xFF00) >> 8 ) / 255.0
        let b = CGFloat((hex & 0xFF)) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
