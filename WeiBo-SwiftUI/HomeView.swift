//
//  HomeView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/28.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 0) {
                    PostListView()
                        .frame(width: UIScreen.main.bounds.width)
                    PostListView()
                        .frame(width: UIScreen.main.bounds.width)
                }
            }
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: 0))
            .navigationBarTitle("首页", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
