//
//  UserData.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/28.
//  Copyright © 2020 MGBook. All rights reserved.
//

import Combine

class UserData: ObservableObject {
    @Published var recommendPostList: PostList = loadPostListData("PostListData_recommend_1.json")
    @Published var hotPostList: PostList = loadPostListData("PostListData_hot_1.json")
    
    // 每条微博的id，和相应的序号
    private var recommendPostDic: [Int: Int] = [:]// id: index
    private var hotPostDic: [Int: Int] = [:]
    
    init() {
        for i in 0..<recommendPostList.list.count {
            let post = recommendPostList.list[i]
            recommendPostDic[post.id] = i
        }
        
        for i in 0..<hotPostList.list.count {
            let post = hotPostList.list[i]
            hotPostDic[post.id] = i
        }
    }
}


// 添加一个函数方便后面使用
extension UserData {
    // 根据类型，找到相应列表
    func postList(for category: PostListCategory) -> PostList {
        switch category {
        case .recommend: return recommendPostList
        case .hot: return hotPostList
        }
    }
    
    // 通过id，找到1条微博
    func post(forId id: Int) -> Post? { //不一定有
        if let index = recommendPostDic[id] {
            return recommendPostList.list[index]
        }
        
        if let index = hotPostDic[id] {
            return hotPostList.list[index]
        }
        
        return nil
    }
    
    // 更新1条微博
    func update(_ post: Post) {
        if let index = recommendPostDic[post.id] {
            recommendPostList.list[index] = post
        }
        
        if let index = hotPostDic[post.id] {
            hotPostList.list[index] = post
        }
    }
}

enum PostListCategory {
    case recommend
    case hot
}
