//
//  SideMenuView.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing :Bool
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green1, Color.splash]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.keyboard,edges: .bottom).ignoresSafeArea()
            
            VStack{
                SideMenuPerson(isShowing: $isShowing)
                    .frame(height: 240)
                    .padding(.bottom,20)
                ForEach(SideMenuModel.allCases, id: \.self) {
                    option in NavigationLink(destination:{
                        //viewModel.needLogin = true
                        return Text(option.titlee)
                        
                    },
                                             label:{
                        SideMenuListView(viewModel: option)
                    })
                }
                
                HStack(spacing:16){
                    Image(systemName:"arrow.left.square" )
                        .frame(width: 24,height: 24)
                   
                    Text("退出登陆")
                        .font(.system(size: 15,weight: .semibold))
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                .onTapGesture {
                    viewModel.needLogin = true
                    
                }
                .fullScreenCover(isPresented: $viewModel.needLogin,
                                  content: {
                     return LoginView()
                    
                 }).alert(isPresented: $viewModel.showAlter){
                     Alert(title: Text("登陆失败"),message: Text("\(viewModel.alterMsg)"))
                 }
                
                Spacer()
            }
            
        }.navigationBarHidden(true)
    }
}


#Preview {
    SideMenuView(isShowing: .constant(true))
}
