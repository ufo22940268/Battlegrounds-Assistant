//
//  Data.swift
//  t
//
//  Created by Frank Cheng on 2019/11/25.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
import SwiftUI

let cardData: [Card] = (load("battleground.json") as [Card]).filter { $0.cardTypeId == 4 }
let heroData: [Hero] = (load("battleground.json") as [Hero]).filter { $0.battlegrounds.hero }
let heroSkillData: [Skill] = load("heros_skills.json") as [Skill]

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
