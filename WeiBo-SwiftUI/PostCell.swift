//
//  PostCell.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/21.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: post.vip)
                        .offset(x:16, y: 16)
                )
            
            VStack(alignment: .leading, spacing: 6) {
                Text(post.name)
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(red: 242/255, green: 99 / 255, blue: 4 / 255))
                .lineLimit(1)
                
                Text(post.date)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 5)
            
            Spacer()
            
            if !post.isFollowed { //没有关注，显示关注按钮
                Button(action: {
                    print("--- Click 关注")
                }) {
                    Text("关注")
                    .font(.system(size: 16))
                    .foregroundColor(.orange)
                    .frame(width: 50, height: 26)
                    .overlay(
                        RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                }
            }
        }
        .padding()
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(avatar: "d0c21786ly1gavj2c0kcej20c8096dh7.jpg",
                            vip: true,
                            name: "用户昵称",
                            date: "2020-04-24",
                            isFollowed: false))
    }
}
