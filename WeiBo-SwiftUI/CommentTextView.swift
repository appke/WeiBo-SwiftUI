//
//  CommentTextView.swift
//  WeiBo-SwiftUI
//
//  Created by MGBook on 2020/4/30.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI

/// 多行评论的View
struct CommentTextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.backgroundColor = .systemGray6
        view.font = .systemFont(ofSize: 18)
        // 上下左右间距都设置 15
        view.textContainerInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.delegate = context.coordinator
        view.text = text
        
        return view
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        let parent: CommentTextView
        
        init(_ view: CommentTextView) { parent = view }
        
        // 文本发生变化时
        func textViewDidChange(_ textView: UITextView) {
            // 让外部知道textView 输入的值
            parent.text = textView.text
        }
    }
}

struct CommentTextView_Previews: PreviewProvider {
    static var previews: some View {
        CommentTextView(text: .constant(""))
    }
}
