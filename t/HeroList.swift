//
//  HeroList.swift
//  t
//
//  Created by Frank Cheng on 2019/11/30.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct HeroList: View {
    var heros: [Hero]
    
    var body: some View {
        List {
            ForEach(heros) { hero in
                KFImage(URL(string: hero.battlegrounds.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 50)
                
            }
        }
    }
}

struct HeroList_Previews: PreviewProvider {
    static var previews: some View {
        HeroList(heros: heroData)
    }
}
