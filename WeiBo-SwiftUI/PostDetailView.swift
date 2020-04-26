//
//  PostDetailView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/26.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        List() {
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
            
            ForEach(0...10, id: \.self) { index in
                Text("评论 \(index)")
                
            }
        }
        .navigationBarTitle("详情", displayMode: .inline)
        
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: postList.list[0])
    }
}
