//
//  PostVIPBadge.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/22.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct PostVIPBadge: View {
    var body: some View {
        Text("V")
            .bold()
            .font(.system(size: 11))
            .frame(width: 15, height: 15)
            .foregroundColor(.yellow)
            .background(Color.red)
            .clipShape(Circle())
            .overlay(
                RoundedRectangle(cornerRadius: 7.5)
                    .stroke(Color.white, lineWidth: 1)
        )
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge()
    }
}
