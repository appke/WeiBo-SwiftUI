//
//  HomeNavigationBar.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/28.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    var leftPercent: CGFloat //0-left, 1-right
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 0) {
            
            Button(action: {
                print("Button camera click")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack(spacing: 5) {
                        HStack {
                            Text("推荐")
                                .bold()
                                .frame(width: kLabelWidth, height: kButtonHeight)
                                .padding(.top, 5)
                            
                            Spacer()
                            
                            Text("热门")
                                .bold()
                                .frame(width: kLabelWidth, height: kButtonHeight)
                                .padding(.top, 5)

                        }
                        // 下划线
            //            RoundedRectangle(cornerRadius: 2)
            //                .foregroundColor(.orange)
            //                .frame(width:30, height: 4)
            //                .offset(x: UIScreen.main.bounds.width * 0.5 * (self.leftPercent - 0.5) + kLabelWidth * CGFloat(0.5 - self.leftPercent)) //左偏移屏幕宽度的1半，加label的1半
                        
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.orange)
                        .frame(width:30, height: 4)
                        .offset(x: geometry.size.width * (self.leftPercent - 0.5) + kLabelWidth * (0.5 - self.leftPercent)) //左偏移屏幕宽度的1半，加label的1半
                }
                .frame(height: 6)
            }
            .frame(width: UIScreen.main.bounds.width * 0.5)  //屏幕的1半，上面要修改
            
            Spacer()
            
            Button(action: {
                print("Button plus click")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBar(leftPercent: 0)
    }
}
