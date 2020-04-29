//
//  HScrollViewController.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/28.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

struct HScrollViewController<Content: View>: UIViewControllerRepresentable {
    let pageWidth: CGFloat
    let contentSize: CGSize
    let content: Content //scrollView上的东西
    @Binding var leftPercent: CGFloat
    
    init(pageWidth: CGFloat, contentSize: CGSize, leftPercent: Binding<CGFloat>,  @ViewBuilder content: () -> Content) {
        self.pageWidth = pageWidth
        self.contentSize = contentSize
        self._leftPercent = leftPercent
        self.content = content()
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    // 创建UIViewController
    func makeUIViewController(context: Context) -> UIViewController {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        context.coordinator.scrollView = scrollView
        
        let vc = UIViewController()
        vc.view.addSubview(scrollView)
        
        // 把content 内容添加到scrollView上，SwiftUI的view添加到 UIKit的view上来，转一下，桥接
        let host = UIHostingController(rootView: content)
        vc.addChild(host)
        scrollView.addSubview(host.view)
        host.didMove(toParent: vc) //告诉host已经添加到vc上来了
        context.coordinator.host = host
        
        return vc
    }
    
    // 更新
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // 取出来
        let scrollView = context.coordinator.scrollView!
        scrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: contentSize.height)
        scrollView.contentSize = contentSize
        // 当前滑动到什么地方
        scrollView.setContentOffset(CGPoint(x: leftPercent * (contentSize.width - pageWidth), y: 0), animated: true)
        
        context.coordinator.host.view.frame = CGRect(origin: .zero, size: contentSize)
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        // 添加一些会用到的属性
        let parent: HScrollViewController
        var scrollView: UIScrollView! //! 否则初始化必须传参数
        var host: UIHostingController<Content>!
        
        init(_ parent: HScrollViewController) {
            self.parent = parent
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // 更新绑定值，拖拽之后，改变view
            withAnimation {
                parent.leftPercent = scrollView.contentOffset.x < parent.pageWidth * 0.5 ? 0 : 1
            }
            // print("--- End")
        }
    }
}
