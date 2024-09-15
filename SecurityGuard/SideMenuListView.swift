//
//  SideMenuListView.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//  这里是侧边菜单中列表导航的样式视图

import SwiftUI

struct SideMenuListView: View {
    let viewModel:SideMenuModel
    
    var body: some View {
        HStack(spacing:16){
            Image(systemName:viewModel.imageName )
                .frame(width: 24,height: 24)
           
            Text(viewModel.titlee)
                .font(.system(size: 15,weight: .semibold))
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
        
        
    }
}
#Preview {
    SideMenuListView(viewModel: .messages)
}
