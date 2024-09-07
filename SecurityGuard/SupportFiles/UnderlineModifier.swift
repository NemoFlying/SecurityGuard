//
//  UnderlineView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI
 
struct UnderlineModifier: ViewModifier {
    /// 下划线颜色
    var color: Color
    /// 下划线高度
    var height: CGFloat
    /// 下划线底部偏移
    var offset: CGFloat
    func body(content: Content) -> some View {
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
 
extension View {
    func underline(color: Color, height: CGFloat = 1, offset: CGFloat = 0) -> some View {
        self.modifier(UnderlineModifier(color: color, height: height, offset: offset))
    }
}
