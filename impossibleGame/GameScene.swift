//
//  GameScene.swift
//  impossibleGame
//
//  Created by Rafael Valer on 8/4/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    
    let texture = SKTexture(imageNamed: "player")
    var player : SKSpriteNode?
    
    
    override func didMoveToView(view: SKView) {
        
        self.player = Player(x: 50, y: 50)
        backgroundColor = SKColor.lightGrayColor()
        
        addChild(player!)
        
        self.addEnemy()
        
        physicsWorld.gravity = CGVectorMake(0, 0) // no gravity
        physicsWorld.contactDelegate = self
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = .Right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedLeft:"))
        swipeLeft.direction = .Left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeUp:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedUp:"))
        swipeUp.direction = .Up
        view.addGestureRecognizer(swipeUp)
        
        let swipeDown:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedDown:"))
        swipeDown.direction = .Down
        view.addGestureRecognizer(swipeDown)
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func playerDidCollideWithEnemy(player:SKSpriteNode, enemy:SKSpriteNode) {
        println("treta")
        let loseAction = SKAction.runBlock()
            {
                println("Hit")
                player.removeFromParent()
                
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let gameOverScene = GameOverScene(size: self.size)
                self.view?.presentScene(gameOverScene, transition: reveal)
        }
        runAction(loseAction)
    }
    
    func addEnemy()
    {
        let enemy = Enemy(x: Int(size.width / 2), y: Int(size.height / 2))
        addChild(enemy)
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer)
    {
        Player.movePlayerToRight(player!)
    }
    func swipedLeft(sender:UISwipeGestureRecognizer)
    {
        Player.movePlayerToLeft(player!)
    }
    func swipedUp(sender:UISwipeGestureRecognizer)
    {
        Player.movePlayerToUp(player!)
    }
    func swipedDown(sender:UISwipeGestureRecognizer)
    {
        Player.movePlayerToDown(player!)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & Configuration.PhysicsCategory.Player != 0) &&
            (secondBody.categoryBitMask & Configuration.PhysicsCategory.Enemy != 0)) {
                playerDidCollideWithEnemy(firstBody.node as! SKSpriteNode, enemy: secondBody.node as! SKSpriteNode)
                
                
        }
    }
    
    
}
