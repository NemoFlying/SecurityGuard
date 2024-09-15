//
//  NavigationView.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/25.
//

import SwiftUI
import CoreLocation
struct NavigationView: View {
    @State var newCoordinate2D :CLLocationCoordinate2D?
    @State  var showMarker: Bool = true
    @State  var showSaftyArea:Bool = true
    @State  var enableCustomLocation:Bool = false
    @State var models:[FeedbackViewModel] = []
    @State var models2:[InspectViewModel] = []
    @ObservedObject var viewModel = NavigationViewModel()
    var body: some View {
        NavigationStack {
            VStack
            {
                ZStack(alignment: .top){
                    Image("HomeImage")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity)
                        .opacity(0.5)
                        .cornerRadius(20)
                        .ignoresSafeArea()
                    VStack{
                        HStack{
                            Text("xxxx员工，你好")
                                .padding(.leading)
                            Spacer()
                            Image(systemName: "book")
                                .padding(.trailing)
                            Image(systemName: "arrowshape.turn.up.backward")
                                .onTapGesture {
                                    viewModel.needLogin = true;
                                }
                        }
                        
                    }
                    
                }
                    //.frame(maxWidth: .infinity,minHeight: 200)
                //Spacer()
                VStack(spacing:20){
                    Text("功能")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                        .padding(.leading)
                    
                    HStack(spacing: 50) {
                        NavigationLink(destination: FeedbackView()){
                            VStack
                            {
                                Image(systemName: "person")
                                    .font(.title)
                                Text("快速反馈")
                                    .font(.system(size: 15))
                            }
                        }
                        NavigationLink(destination: ContentView()){
                            VStack{
                                Image(systemName: "person")
                                    .font(.title)
                                Text("地图")
                                    .font(.system(size: 15))
                            }
                            
                        }
                        NavigationLink(destination: PersonalView()){
                            VStack
                            {
                                Image(systemName: "person")
                                    .font(.title)
                                Text("商城")
                                    .font(.system(size: 15))
                            }
                        }
                        NavigationLink(destination: FeedbackListView()){
                            VStack
                            {
                                Image(systemName: "person")
                                    .font(.title)
                                Text("我的反馈")
                                    .font(.system(size: 15))
                            }
                        }
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading)
                    
                    HStack(spacing: 50, content: {
                        if viewModel.userRole == "超级管理员" {
                            NavigationLink(destination: FeedbackHandleView()){
                                VStack
                                {
                                    Image(systemName: "person")
                                        .font(.title)
                                    Text("反馈处理")
                                        .font(.system(size: 15))
                                }
                            }
                        }
//                        NavigationLink(destination: FeedbackListView(models: models)){
//                            VStack
//                            {
//                                Image(systemName: "person")
//                                    .font(.title)
//                                Text("xxxx")
//                                    .font(.system(size: 15))
//                            }
//                        }
                        if viewModel.userRole == "巡检人员" {
                            NavigationLink(destination: InspectHomeView()){
                                VStack
                                {
                                    Image(systemName: "person")
                                        .font(.title)
                                    Text("巡检管理")
                                        .font(.system(size: 15))
                                }
                            }
                        }
                    })
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading)
                    
                }
                MapView1(
                    showMarker: $showMarker,
                    showSaftyArea: $showSaftyArea,
                    enableCustomLocation: $enableCustomLocation,
                    newCoordinate2D: $newCoordinate2D
                )
            }
            .onAppear{
                models = TestData().FeedbackTestData()
                models2 = TestData().InspectTestData()
            }
            .fullScreenCover(isPresented: $viewModel.needLogin,
                              content: {
                 LoginView()
             }).alert(isPresented: $viewModel.showAlter){
                 Alert(title: Text("登陆失败"),message: Text("\(viewModel.alterMsg)"))
             }
            
        }
    }
}

#Preview {
    return NavigationView()
}
