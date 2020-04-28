//
//  Post.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/22.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

let postList = loadPostListData("PostListData_hot_1.json")

func loadPostListData(_ fileName: String) -> PostList {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can't find \(fileName) in main bundle")
    }
    
    guard let data = try? Data(contentsOf: url) else {
        fatalError("Can't load \(url)")
    }
    
    guard let list = try? JSONDecoder().decode(PostList.self, from: data) else {
        fatalError("Can't parse post list json data")
    }
    return list
}

struct PostList: Codable {
    let list: [Post]
}

// Data Model 最基本属性
struct Post: Codable, Identifiable {
    let id: Int
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    
    var isFollowed: Bool
    
    let text: String
    let images: [String]
    
    var commentCount: Int
    var likeCount: Int
    let isLiked: Bool
    
    // let testa: String
}

/// imageName to Image
func loadImage(name: String) -> Image {
    return Image(uiImage: UIImage(named: name)!)
}

/// UI 相关
extension Post {
    var avaterImage: Image {
        return loadImage(name: avatar)
    }
    
    var commentCountText: String {
        if commentCount <= 0 { return "评论" }
        if commentCount < 1000 { return "\(commentCount)" }
        return String(format: "%.1fK", Double(commentCount) / 1000)
    }
    
    var likeCountText: String {
        if likeCount <= 0 { return "点赞" }
        if likeCount < 1000 { return "\(likeCount)"}
        return String(format: "%.1fK", Double(likeCount) / 1000)
    }
}

/**
{
    "id": 2000,
    "avatar": "6a2afec3jw8fb4ld0qf2gj20e80dsdfz.jpg",
    "vip": false,
    "name": "你的男孩T_T",
    "date": "2020-01-13 08:02",
    "isFollowed": false,
    "text": "给爸妈买的房子，让他们自己搞装修，结果非要装一个这么丑的窗户，姐姐拦也拦不住，问他们为什么，他们说下面有一个TT………[微笑]行吧，老人家开心最重要#爹妈迷惑行为#",
    "images": [
        "6a2afec3gy1gaulykcejqj20t5145wns.jpg"
    ],
    "commentCount": 9503,
    "likeCount": 26085,
    "isLiked": false
},
*/
