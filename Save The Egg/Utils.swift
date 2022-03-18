//
//  Utils.swift
//  Save The Egg
//
//  Created by Amini on 05/03/22.
//

import Foundation
import UIKit

struct ColorType {
    static let backgroundColor = 0xffdfba
    static let pink = 0xffb3ba
    static let green = 0xbaffc9
    static let blue = 0xbae1ff
}

struct PhysicsCategories {
    static let Coins:       UInt32 = UInt32(1)
    static let Saw:         UInt32 = UInt32(2)
    static let Ground:      UInt32 = UInt32(3)
    static let Sangkar:     UInt32 = UInt32(4)
    static let Player:      UInt32 = UInt32(5)
}

struct Utils {
    
    static func scaleNumber(actualSize: CGFloat, expectedSize: CGFloat, forThisSize: CGFloat) -> CGFloat{
        return (expectedSize/actualSize)*forThisSize
    }
    
}


