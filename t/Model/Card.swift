//
//  Card.swift
//  t
//
//  Created by Frank Cheng on 2019/11/25.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Foundation

struct Card: Identifiable, Codable, Hashable {
    var id: Int
    
    var name: String
    var cardTypeId: Int
    var manaCost: Int
}
