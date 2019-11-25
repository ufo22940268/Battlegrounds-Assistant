//
//  ContentView.swift
//  t
//
//  Created by Frank Cheng on 2019/11/22.
//  Copyright © 2019 Frank Cheng. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack() {
            TabView {
                Text("The First Tab")
                    .tabItem {
                        Image(systemName: "cube.fill")
                        Text("卡牌库")
                    }
                Text("Another Tab")
                    .tabItem {
                        Image(systemName: "slider.horizontal.below.rectangle")
                        Text("检索")
                    }
            }
            .font(.headline)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
