//
//  Player.swift
//  
//
//  Created by Rafael Valer on 8/4/15.
//
//

import SpriteKit


class Player: SKSpriteNode {

    static let movementDuration = 0.2
    static let rightMovement = SKAction.moveByX(30, y: 0, duration: movementDuration)
    static let leftMovement = SKAction.moveByX(-30, y: 0, duration: movementDuration)
    static let upMovement = SKAction.moveByX(0, y: 30, duration: movementDuration)
    static let downMovement = SKAction.moveByX(0, y: -30, duration: movementDuration)
    
    // movement methods
    
    init(x: Int, y: Int)
    {
        let playerTexture = SKTexture(imageNamed: "player")
        super.init(texture: playerTexture, color: nil, size: playerTexture.size())
        
        self.position = CGPoint(x: x, y: y)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.dynamic = true
        self.physicsBody?.categoryBitMask = Configuration.PhysicsCategory.Player
        self.physicsBody?.contactTestBitMask = Configuration.PhysicsCategory.Enemy
        self.physicsBody?.collisionBitMask = Configuration.PhysicsCategory.None

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func movePlayerToRight(player: SKSpriteNode)
    {
        println("direita")
        player.runAction(rightMovement)
    }
    static func movePlayerToLeft(player: SKSpriteNode)
    {
        println("esquerda")
        player.runAction(leftMovement)
    }
    static func movePlayerToUp(player: SKSpriteNode)
    {
        println("cima")
        player.runAction(upMovement)
    }
    static func movePlayerToDown(player: SKSpriteNode)
    {
        println("baixo")
        player.runAction(downMovement)
    }
    
}