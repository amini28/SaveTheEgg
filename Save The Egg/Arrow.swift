//
//  Arrow.swift
//  Save The Egg
//
//  Created by Amini on 07/03/22.
//

import Foundation
import SpriteKit

class Arrow: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)        
        
        run(.repeatForever(SKAction.sequence([
            SKAction.fadeOut(withDuration: 0.5),
            SKAction.fadeIn(withDuration: 0.5)
        ])))
    }
    
}
