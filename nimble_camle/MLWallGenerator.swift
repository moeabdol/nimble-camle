//
//  MLWallGenerator.swift
//  nimble_camle
//
//  Created by Mohammad Saed on 8/18/16.
//  Copyright © 2016 moeabdol. All rights reserved.
//

import Foundation
import SpriteKit

class MLWallGenerator: SKSpriteNode {
    var generationTimer: NSTimer?
    var walls: [MLWall] = []

    func startGeneratingWallsEvery(seconds: NSTimeInterval) {
        generationTimer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: "generateWall", userInfo: nil, repeats: true)
    }

    func stopGeneratingWalls() {
        generationTimer!.invalidate()
    }

    func generateWall() {
        var scale: CGFloat!
        let rand = arc4random_uniform(UInt32(2))
        if rand == 0 {
            scale = -1.0
        } else {
            scale = 1.0
        }

        let wall = MLWall()
        wall.position.x = size.width / 2 + wall.size.width / 2
        wall.position.y = scale * (kMLGroundHeight / 2 + wall.size.height / 2)
        walls.append(wall)
        addChild(wall)
    }

    func stopWalls() {
        stopGeneratingWalls()
        for wall in walls {
            wall.stopMoving()
        }
    }
}
