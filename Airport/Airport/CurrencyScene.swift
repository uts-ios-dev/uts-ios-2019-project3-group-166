//
//  CurrencyScene.swift
//  Airport
//
//  Created by Yasmin Zaidi on 29/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

// info from https://www.global-exchange.com.au/branches-at-sydney-airport
import Foundation
import SpriteKit

class CurrencyScene: SKScene {
    let currencyHeading = SKLabelNode()
    
    
    override func didMove(to view: SKView) {
        currencyHeading.fontSize = 150
        currencyHeading.text = "0"
        currencyHeading.fontColor =  SKColor.darkGray
        currencyHeading.zPosition = 2
        currencyHeading.position = CGPoint(x: self.size.width/2, y: self.size.height*0.90)
        self.addChild(currencyHeading)
    }
}
