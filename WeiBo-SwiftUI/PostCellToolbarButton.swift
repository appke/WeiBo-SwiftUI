//
//  PostCellToolbarButton.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/24.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostCellToolbarButton: View {
    let image: String
    let text: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack (spacing: 5){
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                Text(text)
                    .font(.system(size: 17))

            }
            .foregroundColor(color)
            
        }
    }
}

struct PostCellToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        PostCellToolbarButton(image: "heart",
                              text: "评论",
                              color: .orange) {
                                print("Click --- ")
        }
        .previewLayout(.fixed(width: 100, height: 40))
    }
}
