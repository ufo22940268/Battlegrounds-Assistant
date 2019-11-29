//
//  CardDetail.swift
//  t
//
//  Created by Frank Cheng on 2019/11/28.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct CardDetail: View {
    
    let card: Card
    
    var body: some View {
        VStack {
            KFImage(URL(string: card.image))
        }.navigationBarTitle(card.name)
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: cardData.first!)
//            .environment(\.colorScheme, .dark)
    }
}
