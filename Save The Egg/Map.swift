//
//  Map.swift
//  Save The Egg
//
//  Created by Amini on 07/03/22.
//

import Foundation
import SpriteKit

class Map: SKTileMapNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupPhysics(){
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 128, height: 128))
        physicsBody?.isDynamic = false
        physicsBody?.mass = 0
        physicsBody?.affectedByGravity = false
        physicsBody?.isDynamic = false
    }
    
}
