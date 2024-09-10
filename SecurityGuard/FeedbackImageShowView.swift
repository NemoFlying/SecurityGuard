//
//  FeedbackImageShowView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/7.
//

import SwiftUI

struct FeedbackImageShowView: View {
    var feebackImageUrl:[String]
    var baseUrl:String = "https://bf23851vm360.vicp.fun"
    @State var isImageFullScreen:Bool = false
    @State var selectedImage:Image = Image(systemName: "bus")
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(feebackImageUrl,id: \.self){ item in
                    AsyncImage(
                        url: URL(string: "\(baseUrl)"+"\(item)"),
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
                                    self.selectedImage = image
                                    self.isImageFullScreen.toggle()
                                    
                                }
                                .fullScreenCover(isPresented: $isImageFullScreen, content: {
                                    self.selectedImage.resizable()
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
        }
    }
}

#Preview {
    let images = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
    return FeedbackImageShowView(feebackImageUrl: images)
}
