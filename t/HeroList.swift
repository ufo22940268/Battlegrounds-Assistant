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
    
    init(heros: [Hero]) {
        self.heros = heros
        UITableView.appearance().separatorColor = .clear
    }
    
    var hero: Hero {
      heros.first!
    }

    
    var body: some View {
        NavigationView {            
            List {
                ForEach(heros) { hero in
                    ZStack {
                        KFImage(URL(string: hero.battlegrounds.image))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal, 50)
                        NavigationLink(destination: HeroDetail(hero: hero), label: {
                            EmptyView()
                        })
                    }
                    
                }
            }.navigationBarTitle("英雄")
        }
    }
}

struct HeroList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {            
            HeroList(heros: heroData)
        }
    }
}
