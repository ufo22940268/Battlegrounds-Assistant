//
//  CardDetail.swift
//  t
//
//  Created by Frank Cheng on 2019/11/28.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct Stars: View {
    
    var num: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ForEach(0..<num) { _ in
                Image(systemName: "star.fill")
                .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(.yellow)
            }
            if num < 5 {
                ForEach(0..<5 - num) { _ in
                    Image(systemName: "star")
                    .resizable()
                        .frame(width: 30, height: 30, alignment: .leading)
                        .foregroundColor(.yellow)
                }
            }
            Spacer()
        }.padding(20.0)
    }
}

struct CardDetail: View {
    
    let card: Card
    
    var body: some View {
        VStack {
            Stars(num: 3)
            KFImage(URL(string: card.image))
                .resizable(capInsets: EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30), resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 27.482)
                .padding(.top, 20)
            Spacer()
        }
        .navigationBarTitle(card.name)
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardDetail(card: cardData.first!)
        }
    }
}
