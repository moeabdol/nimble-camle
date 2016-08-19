//
//  MLWall.swift
//  nimble_camle
//
//  Created by Mohammad Saed on 8/18/16.
//  Copyright © 2016 moeabdol. All rights reserved.
//

import Foundation
import SpriteKit

class MLWall: SKSpriteNode {
    let WALL_WIDTH: CGFloat =  30.0
    let WALL_HEIGHT: CGFloat = 50.0
    let WALL_COLOR = UIColor.blackColor()

    init() {
        let size = CGSizeMake(WALL_WIDTH, WALL_HEIGHT)
        super.init(texture: nil, color: WALL_COLOR, size: size)
        loadPhysicsBodyWithSize(size)
        startMoving()
    }

    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = wallCategory
        physicsBody?.affectedByGravity = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startMoving() {
        let moveLeft = SKAction.moveByX(-kDefaultXToMovePerSecond, y: 0, duration: 1)
        runAction(SKAction.repeatActionForever(moveLeft))
    }

    func stopMoving() {
        removeAllActions()
    }
}