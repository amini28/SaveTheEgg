//
//  Saw.swift
//  Save The Egg
//
//  Created by Amini on 06/03/22.
//

import Foundation
import SpriteKit

class Saw: SKSpriteNode {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
                
        run(.repeatForever(SKAction.sequence([
            SKAction.rotate(byAngle: 10, duration: 0.5)
        ])))
    }
    
    public func setupPhysics(){
        physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        physicsBody?.isDynamic = false
        physicsBody?.mass = 0
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
        
        physicsBody?.categoryBitMask = PhysicsCategories.Saw
        physicsBody?.collisionBitMask = PhysicsCategories.Player
        physicsBody?.contactTestBitMask = PhysicsCategories.Player
    }
}
