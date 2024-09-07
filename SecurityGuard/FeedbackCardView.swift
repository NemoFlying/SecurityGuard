//
//  FeedbackCardView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/6.
//

import SwiftUI
import CoreLocation
struct FeedbackCardView: View {
    var model:FeedbackViewModel
    @State private var selection = 0
    @State private var isImageFullScreen = false
    @State private var selectImage:Image = Image(systemName: "bus")
    @State private var isMapFullScreen = false
    
    private var handleStatus:String{
        switch(model.feebackHandleStatus){
        case 0:
            return "待处理"
        case 1:
            return "处理中"
        case 2:
            return "已处理"
        default:
            return ""
        }
    }
    private var handeColor:Color{
        switch(model.feebackHandleStatus){
        case 0:
            return .red
        case 1:
            return .yellow
        case 2:
            return backgoundColor
        default:
            return .white
        }
    }
    private var backgoundColor:Color = Color(red: 0.0, green: 0.25, blue: 0.1)
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Text("\(model.feebackTitle)").font(.title2).bold()
                Spacer()
                Text("2024.07.24")
            }
            .padding([.top,.leading,.trailing])
            
            Text("\(model.feebackDetail)")
                .font(.title3)
                .padding([.leading,.trailing])
            
            FeedbackImageShowView(feebackImageUrl: model.feebackImage)
                .padding([.leading,.trailing])
            
            HStack{
                Text("\(model.feebackArea)")
                    .font(.title2)
                    .bold()
                FeedbackMapView(
                    mapLocation: .init(
                        latitude: model.feebackLocation[0],
                        longitude: model.feebackLocation[1]
                    )
                )
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text(handleStatus)
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(handeColor)
                        .cornerRadius(16)
                    //.border(.red)
                    
                })
                
            }.padding([.bottom,.leading,.trailing])
        }
        .background(LinearGradient(colors: [.green,.yellow], startPoint: .leading, endPoint: .trailing))
        .onAppear{
        }
        .cornerRadius(18)
    }
    
    init(model: FeedbackViewModel) {
        self.model = model
    }
}

#Preview {
    @State var model = FeedbackViewModel()
    model.feebackTitle = "道路积水"
    model.feebackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过"
    model.feebackArea = "A1"
    model.feebackLocation = [30.582595601035205,103.718863233145]
    model.feebackHandleStatus = 0
    model.feebackImage = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"
    ,"https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554",
                          "https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
    
    return FeedbackCardView(model: model)

}
