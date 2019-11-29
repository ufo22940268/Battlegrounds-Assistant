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
//        NavigationView {
//            VStack() {
//                CardList()
                TabView {
                    CardList()
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
                .navigationBarTitle(Text("asdfasdfii"))
                .edgesIgnoringSafeArea(.top)
//            }
//        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([0, 1], id: \.self) { i in
            Home().environment(\.colorScheme, i == 0 ? .dark : .light)
        }
    }
}
