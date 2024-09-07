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
                        NavigationLink(destination: FeedbackListView(models: models)){
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
                        NavigationLink(destination: FeedbackHandleView(models: models)){
                            VStack
                            {
                                Image(systemName: "person")
                                    .font(.title)
                                Text("反馈处理")
                                    .font(.system(size: 15))
                            }
                        }
                        NavigationLink(destination: FeedbackListView(models: models)){
                            VStack
                            {
                                Image(systemName: "person")
                                    .font(.title)
                                Text("xxxx")
                                    .font(.system(size: 15))
                            }
                        }
                    })
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading)
                    
                }
                MapView(
                    showMarker: $showMarker,
                    showSaftyArea: $showSaftyArea,
                    enableCustomLocation: $enableCustomLocation,
                    newCoordinate2D: $newCoordinate2D
                )
            }
            .onAppear{
                models = TestData().FeedbackTestData()
            }
            
        }
    }
}

#Preview {
    return NavigationView()
}
