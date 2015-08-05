//
//  Enemy.swift
//  impossibleGame
//
//  Created by Rafael Valer on 8/5/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import SpriteKit


class Enemy: SKSpriteNode {

    init(x: Int, y: Int)
    {
        let enemyTexture = SKTexture(imageNamed: "monster")
        super.init(texture: enemyTexture, color: nil, size: enemyTexture.size())
        
        self.position = CGPoint(x: x, y: y)
        self.physicsBody = SKPhysicsBody(rectangleOfSize: self.size)
        self.physicsBody?.dynamic = true
        self.physicsBody?.categoryBitMask = Configuration.PhysicsCategory.Enemy
        self.physicsBody?.contactTestBitMask = Configuration.PhysicsCategory.Player
        self.physicsBody?.collisionBitMask = Configuration.PhysicsCategory.None
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}