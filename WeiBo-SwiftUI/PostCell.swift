//
//  PostCell.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/21.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("用户昵称")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(red: 242/255, green: 99 / 255, blue: 4 / 255))
                .lineLimit(1)
                
                Text("2020-04-21")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            
            Text("关注")
                .font(.system(size: 16))
                .foregroundColor(.orange)
        }
        
        
        
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
