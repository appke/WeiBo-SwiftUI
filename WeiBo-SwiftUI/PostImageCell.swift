//
//  PostImageCell.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/26.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

private let kImageSpace: CGFloat = 6

struct PostImageCell: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        Group {
            if images.count == 1 {
                loadImage(name: images[0])
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width * 0.75) //4:3
                .clipped()
            } else if images.count == 2 {
                PostImageCellRow(images: images, width: width)
            
            } else if images.count == 3 {
                PostImageCellRow(images: images, width: width)
                
            } else if images.count == 4 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...3]), width: width)
                }
                
            } else if images.count == 5 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...1]), width: width)
                    PostImageCellRow(images: Array(images[2...4]), width: width)
                }
            } else if images.count == 6 {
                VStack(spacing: kImageSpace) {
                    PostImageCellRow(images: Array(images[0...2]), width: width)
                    PostImageCellRow(images: Array(images[3...5]), width: width)
                }
            }

        }
    }
}

struct PostImageCellRow: View {
    let images: [String]
    let width: CGFloat
    
    var body: some View {
        HStack(alignment: .center, spacing: kImageSpace) {
            ForEach (images, id: \.self) { image in
                loadImage(name: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count),
                           height: (self.width - kImageSpace * CGFloat(self.images.count - 1)) / CGFloat(self.images.count))
                    .clipped()
            }
        }
    }
}

struct PostImageCell_Previews: PreviewProvider {
    static var previews: some View {
        let list = postList.list
        let width = UIScreen.main.bounds.size.width
        
        return Group {
            PostImageCell(images: Array(list[5].images[0...0]), width: width)
            PostImageCell(images: Array(list[5].images[0...1]), width: width)
            PostImageCell(images: Array(list[5].images[0...2]), width: width)
            PostImageCell(images: Array(list[5].images[0...3]), width: width)
            PostImageCell(images: Array(list[5].images[0...4]), width: width)
            PostImageCell(images: Array(list[5].images[0...5]), width: width)
        }
        .previewLayout(.fixed(width: width, height: 400))
    }
}
