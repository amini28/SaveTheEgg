//
//  Coin.swift
//  Save The Egg
//
//  Created by Amini on 07/03/22.
//

import Foundation
import SpriteKit

class Coin: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        run(.repeatForever(SKAction.sequence([
            SKAction.scaleX(to: -1, duration: 1),
            SKAction.scaleX(to: 1, duration: 1)
        ])))
    }
    
    public func setupPhysics(){
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.isDynamic = false
        physicsBody?.mass = 0
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
        
        physicsBody?.categoryBitMask = PhysicsCategories.Saw
        physicsBody?.collisionBitMask = PhysicsCategories.Player
        physicsBody?.contactTestBitMask = PhysicsCategories.Player
    }
    
}
