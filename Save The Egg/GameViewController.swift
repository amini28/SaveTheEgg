//
//  GameViewController.swift
//  Save The Egg
//
//  Created by Amini on 28/02/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                // = 1536.0
//                let screenHeight: CGFloat = 2048.0
//                scene.size = CGSize(width: 2048.0, height: 1536.0)
                scene.size = CGSize(width: 2880.0, height: 1728.0)
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsPhysics = true
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
    }
}
