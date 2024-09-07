//
//  FebackListView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI
import CoreLocation
struct FebackListView: View {
    var model:FeebackViewModel
    @State private var selection = 0
    @State private var isImageFullScreen = false
    @State private var selectImage:Image = Image(systemName: "bus")
    @State private var isMapFullScreen = false
    
    @State  var showMarker: Bool = true
    @State  var showSaftyArea:Bool = false
    @State  var enableCustomLocation:Bool = false
    @State var newCoordinate2D :CLLocationCoordinate2D?
    
    private var backgoundColor:Color = Color(red: 0.0, green: 0.25, blue: 0.1)
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack{
                    Text("全部")
                        .underline(color: (selection == 0 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 0
                        }
                }
                Spacer()
                VStack{
                    Text("待处理")
                        .underline(color: (selection == 1 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 1
                        }
                }
                Spacer()
                VStack{
                    Text("处理中").underline(color: (selection == 2 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 2
                        }
                }
                Spacer()
                VStack{
                    Text("已处理").underline(color: (selection == 3 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 3
                        }
                }
            }
            .foregroundColor(.white)
            .font(.title2)
            .padding()
            .background(Color(red: 0.0, green: 0.25, blue: 0.1))
            
            VStack(alignment: .leading,spacing: 10){
                HStack{
                    Text("\(model.feebackTitle)").font(.title2).bold()
                    Spacer()
                    Text("2024.07.24")
                }
                .padding()
                
                Text("\(model.feebackDetail)")
                    .font(.title3)
                    .padding([.leading,.trailing])
                
                HStack{
                    ForEach(model.feebackImage,id: \.self){ item in
                        AsyncImage(
                            url: URL(string: "\(item)"),
                            transaction: .init(animation: .easeInOut)
                        ) { phase in
                            switch phase {
                            case .empty:
                                Text("Loading...")
                            case .success(let image):
                                
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height : /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .onTapGesture {
                                        self.selectImage = image
                                        self.isImageFullScreen.toggle()
                                        
                                    }
                                    .fullScreenCover(isPresented: $isImageFullScreen, content: {
                                        self.selectImage.resizable()
                                            .scaledToFit()
                                            .overlay(
                                                Button("关闭"){
                                                    self.isImageFullScreen.toggle()
                                                }.bold()
                                                    .background(.blue)
                                                    .foregroundColor(.white)
                                                ,alignment: .topTrailing
                                            )
                                    })
                            case .failure:
                                Text("Failed to load")
                            @unknown default:
                                Text("Failed to load")
                            }
                        }
                    }
                }
                .padding([.leading,.trailing])
                
                HStack{
                    Text("\(model.feebackArea)")
                        .font(.title2)
                        .bold()
                    Image(systemName: "mappin.circle")
                        .font(.title2)
                        .onTapGesture {
                            self.isMapFullScreen.toggle()
                            
                        }
                        .fullScreenCover(isPresented: $isMapFullScreen, content: {
                            MapView(
                                showMarker: $showMarker,
                                showSaftyArea: $showSaftyArea,
                                enableCustomLocation: $enableCustomLocation,
                                newCoordinate2D: $newCoordinate2D
                            )
                            .overlay(
                                Button("关闭"){
                                    self.isMapFullScreen.toggle()
                                },alignment: .topTrailing
                            )
                        })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text(model.feebackHandleStatus ? "已处理":"待处理")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(model.feebackHandleStatus ? backgoundColor : .red)
                            .cornerRadius(16)
                            //.border(.red)
                            
                    })
                    
                }.padding([.bottom,.leading,.trailing])
            }
            .frame(maxWidth: .infinity)
            //.cornerRadius(10.0)
            //.border(.blue,width: 2)
            .background(LinearGradient(colors: [.green,.yellow], startPoint: .leading, endPoint: .trailing))
            .padding(.all,10)
            .onAppear{
                self.newCoordinate2D = .init(latitude: model.feebackLocation[0] ,longitude: model.feebackLocation[1])
            }
            
            
            
            
            Spacer()
            
        }
    }
    
    init(model: FeebackViewModel) {
        self.model = model
        //self.newCoordinate2D = .init(latitude: 30.582595601035205, longitude: model.feebackLocation[1])
        //print(model.feebackLocation[0])
//        if let ll = newCoordinate2D{
//            print(ll.latitude)
//        }
    }
}

#Preview {
    @State var model = FeebackViewModel()
    model.feebackTitle = "道路积水"
    model.feebackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过"
    model.feebackArea = "A1"
    model.feebackLocation = [30.582595601035205,103.718863233145]
    model.feebackImage = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
    
    return FebackListView(model: model)
}
