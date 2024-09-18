//
//  SafetyHomeView.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//。这里是安全员的页面样式 ，功能区域是全放显示

import SwiftUI
import CoreLocation


struct SafetyHomeView: View {
    @State private var Site = ""
    //@State var functionModels:[FunctionViewModel]=[]
    @State var newCoordinate2D :CLLocationCoordinate2D?
    @State var isfullScreenMap :Bool = false
    @ObservedObject var viewModel = HomeViewModel()
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
                ZStack(alignment:.topLeading) {
                    //这里是功能区域
                    RoundedRectangle(cornerRadius: 25)
                    //.fill((LinearGradient(gradient: Gradient(colors: [Color.line1, Color.line2]), startPoint: .leading, endPoint: .trailing)))
                        .fill(Color.line1)
                        .frame(width:398,height:(  110*CGFloat(((viewModel.functionViewMode.count/5)+1)) ) )
                    VStack() {
                       
                        if(viewModel.functionViewMode.count>=4){
                            HStack( spacing: 20, content: {
                                ForEach(0..<4,id: \.self){ index in
                                    NavigationLink(destination: viewModel.functionViewMode[index].DynamicView()){
                                        FunctionView(
                                            functionName: viewModel.functionViewMode[index].functionTitle,
                                            sysImageName: viewModel.functionViewMode[index].functionImage
                                        )
                                    }
                                }
                            }).frame(maxWidth: .infinity,alignment: .leading)
                        }
                        HStack(spacing: 20, content: {
                            ForEach((viewModel.functionViewMode.count>=4 ? 4 : 0)..<viewModel.functionViewMode.count,id: \.self){ index in
                                NavigationLink(destination: viewModel.functionViewMode[index].DynamicView()){
                                    FunctionView(
                                        functionName: viewModel.functionViewMode[index].functionTitle,
                                        sysImageName: viewModel.functionViewMode[index].functionImage
                                    )
                                }
                            }
                        }).frame(maxWidth: .infinity,alignment: .leading)
                    }
                    .padding([.leading,.top],20)
                    
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
                ZStack(alignment:.topTrailing){
                    MapView(
                        showMarker: true,
                        showSaftyArea: true,
                        enableCustomLocation: false,
                        newCoordinate2D: $newCoordinate2D
                    )
                    Image(systemName: "arrow.up.forward.app")
                        .font(.title)
                        .background(.blue)
                        .foregroundColor(.white)
                        .onTapGesture {
                            self.isfullScreenMap.toggle()
                        }.fullScreenCover(isPresented: $isfullScreenMap, content: {
                            MapView(
                                showMarker: true,
                                showSaftyArea: true,
                                enableCustomLocation: false,
                                newCoordinate2D: $newCoordinate2D
                            )
                            .overlay(
                                Button("关闭"){
                                    self.isfullScreenMap.toggle()
                                }
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                                    .bold()
                                    .font(.title)
                                ,alignment: .topTrailing
                            )
                        })
                }
                
            }
        }
        .onAppear{
            //var functionModel = FunctionViewModel()
            //functionModels = viewModel.getRoleFunction(roleName: viewModel.userRole)
        }
     
    }
    
    // Mark: 通用公共组件
    struct FunctionView:View {
        var functionName:String
        var sysImageName:String
        var body: some View {
            VStack {
                ZStack(alignment: .center){
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.splash)
                        .frame(width:60,height: 60)
                    Image(systemName:sysImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35,height: 35)
                        .foregroundColor(.white)
                        .padding(.leading,5)
                        }
                Text(functionName)
                    .font(.system(size: 18))
            }
        }
    }
}

#Preview {
    SafetyHomeView()
}
