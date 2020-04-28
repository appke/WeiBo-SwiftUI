//
//  PostListView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/24.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    
    let category: PostListCategory
    
    var postList: PostList {
        switch category {
        case .recommend:
            return loadPostListData("PostListData_recommend_1.json")
        case .hot:
            return loadPostListData("PostListData_hot_1.json")
        }
    }
    
//    init() { //放到首页，以生成就设置，初始化方法没有category属性
//        UITableView.appearance().separatorStyle = .none
//        UITableViewCell.appearance().selectionStyle = .none
//    }
    
    var body: some View {
        
        List {
            ForEach(postList.list) { post in
                ZStack {
                    PostCell(post: post)
                    NavigationLink(destination: PostDetailView(post: post)) {
                        EmptyView()
                    }
                    .hidden()
                }
                .listRowInsets(EdgeInsets())
            }
        }
        
        /*
        // Left margin is not removed
        List(postList.list, id: \.id) { post in
            PostCell(post: post)
        }
        */
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostListView(category: .recommend)
                .navigationBarTitle("微博")
                .navigationBarHidden(true)
        }
        
    }
}
