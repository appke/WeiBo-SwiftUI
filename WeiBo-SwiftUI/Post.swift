//
//  Post.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/22.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI
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

// Data Model
struct Post {
    let avatar: String
    let vip: Bool
    let name: String
    let date: String
    var isFollowed: Bool
    
}

