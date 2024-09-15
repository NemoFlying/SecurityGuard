//
//  HomeView.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//   首页

import SwiftUI

struct HomeView: View {
    @State private var isShowing = false
    //@Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
                VStack {
                    // 这里需要根据登陆的角色显示不一样的页面，加个if吧
                    //EmployeeHomeView 是员工
                    //SafetyHomeView 是安全员
                    //SafetyAdminHomeView 是安全管理员（待定）
                    //EmployeeHomeView()
                    //fei: 无需区分
                    SafetyHomeView()
                        .cornerRadius(isShowing ? 20:10)
                        .offset(x:isShowing ? 260:0,y: isShowing ? 24:0)
                        .scaleEffect(isShowing ? 0.8:1)
                }
                .navigationBarItems(leading: BackBtn,trailing:NewsBtn)
                .toolbarBackground(.hidden, for: .navigationBar)
                .ignoresSafeArea()
            }.fullScreenCover(isPresented: $viewModel.needLogin,
                              content: {
                 LoginView()
             }).alert(isPresented: $viewModel.showAlter){
                 Alert(title: Text("登陆失败"),message: Text("\(viewModel.alterMsg)"))
             }
            
        }
    }
    
    
// 打开侧边菜单按钮
    private var BackBtn:some View{
        Button(action: {withAnimation(.spring()){isShowing.toggle()}},label: {
            Image(systemName: "text.justify")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 20,height: 20)
                .tint(.white)
                .padding(.bottom,16)
            
        })}
    
// 打开我的消息的按钮
    private var NewsBtn:some View{
        
        Button(action:{
            //打开我的消息
        }){
            Image(systemName: "bell")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 20,height: 20)
                .tint(.white)
                .padding(.bottom,16)

        }
    }
        
}
               
#Preview {
    HomeView()
}
