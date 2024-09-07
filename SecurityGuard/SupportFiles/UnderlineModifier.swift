//
//  UnderlineView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI

struct UnderlineView: ViewModifier {
    /// 下划线颜色
        var color: Color
        /// 下划线高度
        var height: CGFloat
        /// 下划线底部偏移
        var offset: CGFloat
    func body(content: ContentView) -> some View {
        content
                    .overlay(
                        GeometryReader { geometry in
                            Rectangle()
                                .frame(height: height)
                                .foregroundColor(color)
                                .offset(y: geometry.size.height - height - offset) // 根据文本高度调整下划线的位置
                        }
                    )
    }
}
