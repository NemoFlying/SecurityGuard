//
//  StyleTemplates.swift
//  SafeFactory
//
//  Created by 熊何凡 on 2024/8/17.
//  这里放常用的样式，直接调用，减少页面代码显示

import SwiftUI

struct ThreadsTextFieldModifier:ViewModifier{
    // 这个是申请登陆的输入框样式
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
    
    
}

struct buttomFieldModifier:ViewModifier{
    // 这个是申请登陆的按钮样式
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(width: 352,height: 44)
            .background(Color(red:29/255,green: 80/255,blue: 63/255))
            .cornerRadius(8)
    }
}
