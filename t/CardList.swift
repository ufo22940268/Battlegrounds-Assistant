//
//  CardList.swift
//  t
//
//  Created by Frank Cheng on 2019/11/26.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI

struct CardList: View {
    
    var cardGroups: [Int: [Card]] {
        Dictionary(
            grouping: cardData, by: { $0.manaCost }
        )
    }
    
    var body: some View {
        List {
            ForEach(cardGroups.keys.sorted(), id: \.self) { key in
                Section(header: Image(systemName: "\(key).circle.fill")) {
                    ForEach(self.cardGroups[key]!) { card in
                        Text(card.name)
                    }
                }
            }
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList().environment(\.colorScheme, .dark)
    }
}
