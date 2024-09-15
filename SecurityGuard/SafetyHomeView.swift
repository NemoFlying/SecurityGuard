//
//  SafetyHomeView.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//。这里是安全员的页面样式 ，功能区域是全放显示

import SwiftUI

struct SafetyHomeView: View {
    @State private var Site = ""
    var body: some View {
        ZStack{
            Color(red: 76/255, green: 134/255, blue: 110/255).ignoresSafeArea()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.splash)
                        .frame(width:400,height: 360)
                    RoundedRectangle(cornerRadius: 25)
                        .fill((LinearGradient(gradient: Gradient(colors: [Color.line1, Color.line2]), startPoint: .leading, endPoint: .trailing)))
                        .frame(width: 350,height: 180)
                        .offset(y:70)
                    Text("欢迎使用安巡卫士")
                        .font(.system(size: 28))
                        .offset(x:-60,y: -70)
                        .foregroundColor(.white)
                    Text("这里我后面放安全员巡检相关的显示，先占个位置")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .offset(y: 30)
                        .foregroundColor(.black)
                        .frame(width: 300)
                    
                }
                ZStack {
                    //这里是功能区域
                    RoundedRectangle(cornerRadius: 25)
                    //.fill((LinearGradient(gradient: Gradient(colors: [Color.line1, Color.line2]), startPoint: .leading, endPoint: .trailing)))
                        .fill(Color.line1)
                        .frame(width:398,height: 210)
                    VStack(alignment:.leading) {
                        HStack(spacing:20) {
                            //第一行功能区域按钮
                            //我的巡检
                             Button(action:{
                                 //点击跳转至对应的页面
                             }){
                                 VStack {
                                     ZStack(alignment: .center){
                                         RoundedRectangle(cornerRadius: 15)
                                             .fill(Color.splash)
                                             .frame(width:60,height: 60)
                                         Image(systemName:"doc.text.magnifyingglass")
                                             .resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .frame(width: 35,height: 35)
                                             .foregroundColor(.white)
                                             .padding(.leading,5)
                                             }
                                     Text("我的巡检")
                                         .font(.system(size: 18))
                                 }.padding(.leading,10)
                             }
                             //巡检管理
                             Button(action:{
                                 //点击跳转至对应的页面
                             }){
                                 VStack {
                                     ZStack(alignment: .center){
                                         RoundedRectangle(cornerRadius: 15)
                                             .fill(Color.splash)
                                             .frame(width:60,height: 60)
                                         Image(systemName:"person.2.badge.gearshape")
                                             .resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .frame(width: 35,height: 35)
                                             .foregroundColor(.white)
                                             .padding(.leading,5)
                                             }
                                     Text("巡检管理")
                                         .font(.system(size: 18))
                                 }
                               }
                             //反馈处理
                             Button(action:{
                                 //点击跳转至对应的页面
                             }){
                                 VStack {
                                     ZStack(alignment: .center){
                                         RoundedRectangle(cornerRadius: 15)
                                             .fill(Color.splash)
                                             .frame(width:60,height: 60)
                                         Image(systemName:"pencil.and.outline")
                                             .resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .frame(width: 35,height: 35)
                                             .foregroundColor(.white)
                                             }
                                     Text("反馈处理")
                                         .font(.system(size: 18))
                                 }
                               }
                            //问题反馈
                            Button(action:{
                                //点击跳转至对应的页面
                            }){
                                VStack {
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.splash)
                                            .frame(width:60,height: 60)
                                        Image(systemName:"pencil.and.list.clipboard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35,height: 35)
                                            .foregroundColor(.white)
                                            .padding(.leading,10)
                                            }
                                    Text("问题反馈")
                                        .font(.system(size: 18))
                                }
                              }
                        }
                        
                        HStack(spacing:20){
                            //第二行功能区域按钮
                            //我的反馈
                            Button(action:{
                                //点击跳转至对应的页面
                            }){
                                VStack {
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.splash)
                                            .frame(width:60,height: 60)
                                        Image(systemName:"book.pages")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35,height: 35)
                                            .foregroundColor(.white)
                                            }
                                    Text("我的反馈")
                                        .font(.system(size: 18))
                                }
                              }.padding(.leading,10)
                            
                            //地图
                            Button(action:{
                                //点击跳转至对应的页面
                            }){
                                VStack {
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.splash)
                                            .frame(width:60,height: 60)
                                        Image(systemName:"map")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35,height: 35)
                                            .foregroundColor(.white)
                                            }
                                    Text("地图")
                                        .font(.system(size: 20))
                                }.padding(.leading,5)
                            }
                            //积分商城
                            Button(action:{
                                //点击跳转至对应的页面
                            }){
                                VStack {
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.splash)
                                            .frame(width:60,height: 60)
                                        Image(systemName:"giftcard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 35,height: 35)
                                            .foregroundColor(.white)
                                            }
                                    Text("积分商城")
                                        .font(.system(size: 18))
                                }.padding(.leading,5)
                            }
                            //备留一个不用就删掉
                            Button(action:{
                                //点击跳转至对应的页面
                            }){
                                VStack {
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.splash)
                                            .frame(width:60,height: 60)
                                        Image(systemName:"circle.dashed")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 40,height: 40)
                                            .foregroundColor(.white)
                                            }
                                    Text("备留功能")
                                        .font(.system(size: 18))
                                }.padding(.trailing,20)
                            }
                            //备留
                        }
                    }
                    
                }
                
        
                ZStack {
                    //这里是风险区域提醒通知区域，等我后面优化样式
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.green6)
                        .frame(width:398,height: 40)
                    Text("消息通知区域")
                        .font(.system(size: 28))
                    .foregroundColor(.red)
                }
                Spacer()
                // 这里是地图区域,你放置地图后就删除下面的文字
                Text("地图区域")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                Spacer()
                
            }
        }
     
    }
}

#Preview {
    SafetyHomeView()
}
