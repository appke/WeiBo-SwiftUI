//
//  HomeView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/28.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var leftPercent: CGFloat = 0
    @EnvironmentObject var userData :UserData
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
        
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                HScrollViewController(pageWidth: geometry.size.width,
                                      contentSize: CGSize(width: geometry.size.width * 2, height: geometry.size.height),
                                      leftPercent: self.$leftPercent
                ) {
                    HStack(spacing: 0) {
                        PostListView(category: .recommend)
                            .frame(width: UIScreen.main.bounds.width)
                            .environmentObject(self.userData)
                        PostListView(category: .hot)
                            .frame(width: UIScreen.main.bounds.width)
                            .environmentObject(self.userData)
                    }
                }
            }
            //            ScrollView(.horizontal, showsIndicators: true) {
//                HStack(spacing: 0) {
//                    PostListView(category: .recommend)
//                        .frame(width: UIScreen.main.bounds.width)
//                    PostListView(category: .hot)
//                        .frame(width: UIScreen.main.bounds.width)
//                }
//            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarItems(leading: HomeNavigationBar(leftPercent: $leftPercent))
            .navigationBarTitle("首页", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserData())
    }
}
