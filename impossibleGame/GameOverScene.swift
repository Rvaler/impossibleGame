//
//  GameOverScene.swift
//  impossibleGame
//
//  Created by Rafael Valer on 8/4/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    override init(size: CGSize) {
        
        super.init(size: size)
        backgroundColor = SKColor.clearColor()
        
        let displayMessage = "Game Over"
        
        let gameOverLabel = SKLabelNode(fontNamed: "Avenir")
        gameOverLabel.text = displayMessage
        gameOverLabel.fontSize = 36
        gameOverLabel.fontColor = SKColor.redColor()
        gameOverLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameOverLabel)
        
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock(){
                
                let sceneTransition = SKTransition.crossFadeWithDuration(0.5)
                let scene = GameScene(size: size)
                self.view?.presentScene(scene, transition: sceneTransition)
            }
        ]))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
