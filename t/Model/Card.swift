//
//  Card.swift
//  t
//
//  Created by Frank Cheng on 2019/11/25.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Foundation

struct BattleGrounds: Codable, Hashable {
    var hero: Bool
    var image: String
    var tier: Int?
}

struct Card: Identifiable, Codable, Hashable {
    
    var name: String
    var cardTypeId: Int
    var manaCost: Int
    var image: String
    var text: String
    
    var childIds: [Int]
    var id: Int
    
    var battlegrounds: BattleGrounds
}


typealias Hero = Card
typealias Skill = Card
