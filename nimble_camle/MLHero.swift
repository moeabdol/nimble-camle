//
//  MLHero.swift
//  nimble_camle
//
//  Created by Mohammad Saed on 8/17/16.
//  Copyright © 2016 moeabdol. All rights reserved.
//

import Foundation
import SpriteKit

class MLHero: SKSpriteNode {
    var body: SKSpriteNode!
    var arm: SKSpriteNode!
    var leftFoot: SKSpriteNode!
    var rightFoot: SKSpriteNode!
    
    var isUpsideDown = false
    
    init() {
        let size = CGSizeMake(32, 44)
        super.init(texture: nil, color: UIColor.clearColor(), size: size)
        
        loadApperance()
        loadPhysicsBodyWithSize(size)
    }

    func loadApperance() {
        body = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(self.frame.size.width + 4, 46))
        body.position = CGPointMake(0, 6)
        addChild(body)
        
        let skinColor = UIColor(red: 207.0/255.0, green: 193.0/255.0, blue: 169.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSizeMake(self.frame.size.width, 12))
        face.position = CGPointMake(2, 6)
        body.addChild(face)
        
        let egal = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.size.width + 4, 2))
        egal.position = CGPointMake(0, 18)
        body.addChild(egal)
        
        let redDot1 = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(2, 2))
        let redDot2 = redDot1.copy() as! SKSpriteNode
        let redDot3 = redDot1.copy() as! SKSpriteNode
        let redDot4 = redDot1.copy() as! SKSpriteNode
        let redDot5 = redDot1.copy() as! SKSpriteNode
        let redDot6 = redDot1.copy() as! SKSpriteNode
        let redDot7 = redDot1.copy() as! SKSpriteNode
        let redDot8 = redDot1.copy() as! SKSpriteNode
        let redDot9 = redDot1.copy() as! SKSpriteNode
        let redDot10 = redDot1.copy() as! SKSpriteNode
        let redDot11 = redDot1.copy() as! SKSpriteNode
        let redDot12 = redDot1.copy() as! SKSpriteNode
        let redDot13 = redDot1.copy() as! SKSpriteNode
        let redDot14 = redDot1.copy() as! SKSpriteNode
        let redDot15 = redDot1.copy() as! SKSpriteNode
        let redDot16 = redDot1.copy() as! SKSpriteNode
        let redDot17 = redDot1.copy() as! SKSpriteNode
        let redDot18 = redDot1.copy() as! SKSpriteNode
        let redDot19 = redDot1.copy() as! SKSpriteNode
        let redDot20 = redDot1.copy() as! SKSpriteNode
        redDot1.position = CGPointMake(-14, 21)
        redDot2.position = CGPointMake(-10, 21)
        redDot3.position = CGPointMake(-6, 21)
        redDot4.position = CGPointMake(-2, 21)
        redDot5.position = CGPointMake(2, 21)
        redDot6.position = CGPointMake(6, 21)
        redDot7.position = CGPointMake(10, 21)
        redDot8.position = CGPointMake(14, 21)
        redDot9.position = CGPointMake(-12, 14)
        redDot10.position = CGPointMake(-8, 14)
        redDot11.position = CGPointMake(-4, 14)
        redDot12.position = CGPointMake(0, 14)
        redDot13.position = CGPointMake(4, 14)
        redDot14.position = CGPointMake(8, 14)
        redDot15.position = CGPointMake(12, 14)
        redDot16.position = CGPointMake(16, 14)
        redDot17.position = CGPointMake(-16, 14)
        redDot18.position = CGPointMake(-16, 10)
        redDot19.position = CGPointMake(-16, 6)
        redDot20.position = CGPointMake(-16, 2)
        body.addChild(redDot1)
        body.addChild(redDot2)
        body.addChild(redDot3)
        body.addChild(redDot4)
        body.addChild(redDot5)
        body.addChild(redDot6)
        body.addChild(redDot7)
        body.addChild(redDot8)
        body.addChild(redDot9)
        body.addChild(redDot10)
        body.addChild(redDot11)
        body.addChild(redDot12)
        body.addChild(redDot13)
        body.addChild(redDot14)
        body.addChild(redDot15)
        body.addChild(redDot16)
        body.addChild(redDot17)
        body.addChild(redDot18)
        body.addChild(redDot19)
        body.addChild(redDot20)
        
        let eyeColor = UIColor.whiteColor()
        let leftEye = SKSpriteNode(color: eyeColor, size: CGSizeMake(6, 6))
        let rightEye = leftEye.copy() as! SKSpriteNode
        let pupil = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(3,3))
        
        pupil.position = CGPointMake(2, 0)
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        
        leftEye.position = CGPointMake( -4, 0)
        face.addChild(leftEye)
        rightEye.position = CGPointMake(14, 0)
        face.addChild(rightEye)
        
        let eyebrow = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(11, 1))
        eyebrow.position = CGPointMake(-1, leftEye.size.height / 2)
        leftEye.addChild(eyebrow)
        rightEye.addChild(eyebrow.copy() as! SKSpriteNode)
        
        let armColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        arm = SKSpriteNode(color: armColor, size: CGSizeMake(8, 14))
        arm.anchorPoint = CGPointMake(0.5, 0.9)
        arm.position = CGPointMake(-10, -7)
        body.addChild(arm)
        
        let hand = SKSpriteNode(color: skinColor, size: CGSizeMake(arm.size.width, 5))
        hand.position = CGPointMake(0, -arm.size.height * 0.9 + hand.size.height / 2)
        arm.addChild(hand)
        
        leftFoot = SKSpriteNode(color: skinColor, size: CGSizeMake(9, 4))
        leftFoot.position = CGPointMake(-6, -size.height / 2 + leftFoot.size.height / 2)
        addChild(leftFoot)
        
        rightFoot = leftFoot.copy() as! SKSpriteNode
        rightFoot.position = CGPointMake(8, -size.height / 2 + leftFoot.size.height / 2)
        addChild(rightFoot)
    }

    func loadPhysicsBodyWithSize(size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOfSize: size)
        physicsBody?.categoryBitMask = heroCategory
        physicsBody?.contactTestBitMask = wallCategory
        physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flip() {
        isUpsideDown = !isUpsideDown
        
        var scale: CGFloat!
        if isUpsideDown {
            scale = -1.0
        } else {
            scale = 1.0
        }
        let translate = SKAction.moveByX(0, y: scale * (size.height + kMLGroundHeight), duration: 0.1)
        let flip = SKAction.scaleYTo(scale, duration: 0.1)
        
        runAction(translate)
        runAction(flip)
    }
    
    func startRunning() {
        let rotateBack = SKAction.rotateByAngle(-CGFloat(M_PI) / 2.0, duration: 0.1)
        arm.runAction(rotateBack)
        performOneRunCycle()
    }
    
    func performOneRunCycle() {
        let up = SKAction.moveByX(0, y: 2, duration: 0.05)
        let down = SKAction.moveByX(0, y: -2, duration: 0.05)
        
        leftFoot.runAction(up, completion: { () -> Void in
            self.leftFoot.runAction(down)
            self.rightFoot.runAction(up, completion: { () -> Void in
                self.rightFoot.runAction(down, completion: { () -> Void in
                    self.performOneRunCycle()
                })
            })
        })
    }
    
    func breathe() {
        let breatheOut = SKAction.moveByX(0, y: -2, duration: 1)
        let breatheIn = SKAction.moveByX(0, y: 2, duration: 1)
        let breath = SKAction.sequence([breatheOut, breatheIn])
        body.runAction(SKAction.repeatActionForever(breath))
    }
    
    func stop() {
        body.removeAllActions()
        leftFoot.removeAllActions()
        rightFoot.removeAllActions()
    }
}
