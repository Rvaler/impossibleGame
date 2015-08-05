//
//  Configurations.swift
//  impossibleGame
//
//  Created by Rafael Valer on 8/5/15.
//  Copyright (c) 2015 RafaelValer. All rights reserved.
//

import Foundation
import SpriteKit

class Configuration : NSObject
{
    
    struct PhysicsCategory {
        static let None : UInt32 = 0
        static let Player : UInt32 = 0b1       // 1
        static let Enemy: UInt32 = 0b10      // 2
    }
    
}