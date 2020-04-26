//
//  PostListView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/24.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostListView: View {
    var body: some View {
        
        List {
            ForEach(postList.list) { post in
                PostCell(post: post)
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
        PostListView()
    }
}
