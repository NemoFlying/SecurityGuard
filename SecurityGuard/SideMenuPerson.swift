//
//  SideMenuPerson.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//  这里是侧边菜单中员工信息的样式视图

import SwiftUI

struct SideMenuPerson: View {
    @Binding var isShowing:Bool
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ZStack(alignment:.topTrailing) {
             // 关闭按钮
            Button(action: {withAnimation(.spring()){isShowing.toggle()}}, label: {
                Image(systemName:"chevron.right.2" )
                    .frame(width:32,height:32)
                    .foregroundColor(.white)
                    .padding()
            })
            VStack(alignment: .leading){
                Image("logo1")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64,height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.bottom,16)
                //这里的姓名 部门 角色 积分 反馈了多少单子 这些需要从其他地方获取
                Text(viewModel.userName)
                    .font(.system(size: 24,weight: .semibold))
                    .padding(.bottom,18)
                Text(viewModel.userRole).padding(.bottom,18)
                //Text("员工").padding(.bottom,18)
                HStack(spacing:12){
                    HStack(spacing:4){
                        Text("112").bold()
                        Text("积分")
                    }
                    HStack(spacing:4){
                        Text("18").bold()
                        Text("反馈单")
                    }
                    Spacer()
                }
                Spacer()
                
            }.padding()
        }
        
        
    }
}


#Preview {
    SideMenuPerson(isShowing: .constant(true))
}
