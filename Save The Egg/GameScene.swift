//
//  GameScene.swift
//  Save The Egg
//
//  Created by Amini on 28/02/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private let cameraNode = SKCameraNode()
//    private var dot : SKShapeNode!
    private var player: SKSpriteNode!
    
    private func initializeObject(){
        
        
        children.forEach({ node in
              
            if let coin = node as? Coin {
                coin.setupPhysics()
            }
            
            if let saw = node as? Saw {
                saw.setupPhysics()
            }
            
        })
        
        self.player = self.childNode(withName: "//Player") as? SKSpriteNode
        if let player = self.player {
            player.physicsBody = SKPhysicsBody(circleOfRadius: 50)
            player.physicsBody?.mass = 0.01
            player.physicsBody?.linearDamping = 1.0
            player.physicsBody?.friction = 0.0
            player.physicsBody?.restitution = 1.0
            player.physicsBody?.allowsRotation = true
            player.physicsBody?.isDynamic = true
            player.physicsBody?.affectedByGravity = true
            player.physicsBody?.contactTestBitMask = PhysicsCategories.Ground
            player.physicsBody?.categoryBitMask = PhysicsCategories.Player
        }
        
        mapChecking()

    }
    
    private func mapChecking(){
        
        guard let tileMap = self.childNode(withName: "Map") as? SKTileMapNode else { fatalError("Missing tile map for the level") }

        let tileSize = tileMap.tileSize
        let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height

        for col in 0..<tileMap.numberOfColumns {
            for row in 0..<tileMap.numberOfRows {
                let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row)

                let isCenterTile = tileDefinition?.name == "Grass_Grid_Center" ? true : false
                if (isCenterTile) {
                    let x = CGFloat(col) * tileSize.width - halfWidth
                    let y = CGFloat(row) * tileSize.height - halfHeight
                    let rect = CGRect(x: 0, y: 0, width: tileSize.width, height: tileSize.height)
                    let tileNode = SKShapeNode(rect: rect)
                    tileNode.position = CGPoint(x: x, y: y)
                    tileNode.physicsBody = SKPhysicsBody.init(rectangleOf: tileSize, center: CGPoint(x: tileSize.width / 2.0, y: tileSize.height / 2.0))
                    tileNode.physicsBody?.isDynamic = false
                    tileNode.physicsBody?.angularDamping = 1.0
                    tileNode.physicsBody?.friction = 0.0
                    tileNode.physicsBody?.restitution = 1.0
                    tileNode.physicsBody?.collisionBitMask = PhysicsCategories.Player
                    tileNode.physicsBody?.categoryBitMask = PhysicsCategories.Ground
                    tileNode.physicsBody?.contactTestBitMask = PhysicsCategories.Player
                    tileMap.addChild(tileNode)
                }
            }
        }
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        
        initializeObject()
        
        cameraNode.position = CGPoint(x: 0,
                                      y: 0)
            
        addChild(cameraNode)
        camera = cameraNode
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        changeGravity()
        cameraNode.position = player.position
    }
    
    func changeGravity(){
        
        switch UIDevice.current.orientation {
        case .portrait :
            print("potrait")
            physicsWorld.gravity = CGVector(dx: 1.0, dy: 0.0)
        case .portraitUpsideDown :
            print("upsidedown")
            physicsWorld.gravity = CGVector(dx: -1.0, dy: 0.0)
        case .landscapeLeft :
            print("left")
            physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        case .landscapeRight :
            print("right")
            physicsWorld.gravity = CGVector(dx: 0.0, dy: 1.0)
        default :
        break

        }

    }
    
}
