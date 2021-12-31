//
//  SnakeHead.swift
//  snakeles8
//
//  Created by Денис Соснин on 30.12.2021.
//

import UIKit

class SnakeHead: SnakeBodyPart {
    override init (atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        self.physicsBody?.categoryBitMask = CollisionCategroies.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisionCategroies.EdgeBody | CollisionCategroies.Apple | CollisionCategroies.Snake
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
