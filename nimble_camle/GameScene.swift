//
//  GameScene.swift
//  nimble_camle
//
//  Created by Mohammad Saed on 8/17/16.
//  Copyright (c) 2016 moeabdol. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var movingGround: MLMovingGround!
    var hero: MLHero!
    var cloudGenerator: MLCloudGenerator!
    var wallGenerator: MLWallGenerator!

    var isStarted = false
    var isGameOver = false

    override func didMoveToView(view: SKView) {
        backgroundColor = UIColor(red: 159.0/255.0, green: 201.0/255.0, blue: 244.0/255.0, alpha: 1.0)

        movingGround = MLMovingGround(size: CGSizeMake(view.frame.size.width, kMLGroundHeight))
        movingGround.position = CGPointMake(0, view.frame.size.height / 2)
        addChild(movingGround)

        hero = MLHero()
        hero.position = CGPointMake(70, movingGround.position.y + movingGround.frame.size.height / 2 + hero.frame.size.height / 2)
        addChild(hero)
        hero.breathe()

        cloudGenerator = MLCloudGenerator(color: UIColor.clearColor(), size: view.frame.size)
        cloudGenerator.position = view.center
        addChild(cloudGenerator)
        cloudGenerator.populate(7)
        cloudGenerator.startGeneratingWithSpawnTime(5)

        wallGenerator = MLWallGenerator(color: UIColor.clearColor(), size: view.frame.size)
        wallGenerator.position = view.center
        addChild(wallGenerator)

        let tapToStartLabel = SKLabelNode(text: "Tap to start!")
        tapToStartLabel.name = "tapToStartLabel"
        tapToStartLabel.position.x = view.center.x
        tapToStartLabel.position.y = view.center.y + 40
        tapToStartLabel.fontName = "Helvetica"
        tapToStartLabel.fontColor = UIColor.blackColor()
        tapToStartLabel.fontSize = 22.0
        addChild(tapToStartLabel)

        physicsWorld.contactDelegate = self
    }

    func start() {
        isStarted = true

        let tapToStartLabel = childNodeWithName("tapToStartLabel")
        tapToStartLabel!.removeFromParent()

        hero.stop()
        hero.startRunning()
        movingGround.start()
        wallGenerator.startGeneratingWallsEvery(1)
    }

    func gameOver() {
        isGameOver = true

        hero.physicsBody = nil
        wallGenerator.stopWalls()
        movingGround.stop()
        hero.stop()

        let gameOverLabel = SKLabelNode(text: "Game Over!")
        gameOverLabel.name = "gameOverLabel"
        gameOverLabel.position.x = view!.center.x
        gameOverLabel.position.y = view!.center.y + 40
        gameOverLabel.fontName = "Helvetica"
        gameOverLabel.fontColor = UIColor.blackColor()
        gameOverLabel.fontSize = 22.0
        addChild(gameOverLabel)
    }

    func restart() {
        cloudGenerator.stopGenerating()

        let newScene = GameScene(size: view!.bounds.size)
        newScene.scaleMode = .AspectFill

        view!.presentScene(newScene)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if isGameOver {
            restart()
        } else if !isStarted {
            start()
        } else {
            hero.flip()
        }
    }

    func didBeginContact(contact: SKPhysicsContact) {
        gameOver()
        print("didBeginContact called")
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
