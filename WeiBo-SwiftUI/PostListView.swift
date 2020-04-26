//
//  PostListView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/24.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
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
            PostListView()
                .navigationBarTitle("微博")
                .navigationBarHidden(true)
        }
        
    }
}
