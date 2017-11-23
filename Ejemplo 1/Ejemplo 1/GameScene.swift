//
//  GameScene.swift
//  Ejemplo 1
//
//  Created by Alexis Rogelio León Licea on 19/11/17.
//  Copyright © 2017 Evolution Technologies SA de CV. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let cam = SKCameraNode()
    let bee = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = .zero
        self.backgroundColor = UIColor(red: 0.4, green: 0.6, blue: 0.95, alpha: 1.0)
        self.camera = cam
        self.addTheFlyingBee()
    }
    
    override func didSimulatePhysics() {
        self.camera!.position = bee.position
    }
    
    func addTheFlyingBee() {
        bee.position = CGPoint(x: 250, y:250)
        bee.size = CGSize(width: 28, height: 24)
        self.addChild(bee)
        let beeAtlas = SKTextureAtlas(named: "Enemies")
        let beeFrames: [SKTexture] = [
            beeAtlas.textureNamed("bee"),
            beeAtlas.textureNamed("bee-fly")
        ]
        let flyAction = SKAction.animate(with: beeFrames, timePerFrame: 0.14)
        let beeAction = SKAction.repeatForever(flyAction)
        bee.run(beeAction)
        let pathLeft = SKAction.moveBy(x: -200, y: -10, duration: 2)
        let pathRight = SKAction.moveBy(x: 200, y: 10, duration: 2)
        let flipTextureNegative = SKAction.scaleX(to: -1, duration: 0)
        let flipTexturePositive = SKAction.scaleX(to: 1, duration: 0)
        let flightOfTheBee = SKAction.sequence([pathLeft,flipTextureNegative,pathRight,flipTexturePositive])
        let neverEndingFly = SKAction.repeatForever(flightOfTheBee)
        bee.run(neverEndingFly)
    }
}
