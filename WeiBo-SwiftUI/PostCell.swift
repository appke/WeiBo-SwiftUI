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
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                post.avaterImage
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
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Text(post.text)
                .font(.system(size: 17))
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.size.width - 30)
            }
            
            Divider()
            
            HStack {
                Spacer()
                
                PostCellToolbarButton(image: "message", text: post.commentCountText, color: .black) {
                    print("message Click")
                }
                
                Spacer()
                
                PostCellToolbarButton(image: "heart", text: post.likeCountText, color: .black) {
                    print("like Click")
                }
                
                Spacer()
            }
            
            // cell之间分割线
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/255.0, green: 238/255.0, blue: 238/255.0))
        }
        .padding(.horizontal, 15)
        .padding(.top, 15)
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
//        PostCell(post: Post(avatar: "8a0b5544jw1e8qgp5bmzyj2050050aa8.jpg",
//                            vip: true,
//                            name: "用户昵称",
//                            date: "2020-04-24",
//                            isFollowed: false))
        
        PostCell(post: postList.list[3])
    }
}
