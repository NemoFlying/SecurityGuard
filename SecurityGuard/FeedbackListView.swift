//
//  FebackListView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI
import CoreLocation
struct FeedbackListView: View {
    @State var models:[FeedbackViewModel]=[]
    @State private var selection = 0
    @State private var isLoadingMore = false
    var vieModel = FeedbackViewModel()
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
            .background(backgoundColor)
            ScrollView(.vertical,showsIndicators: false){
                
                
                if selection == 0{
                    
                    ForEach(0..<models.count,id: \.self){index in
                        //                if model.feebackHandleStatus = 0{
                        //
                        //                }
                        FeedbackCardView(model: models[index])
                            .padding([.leading,.trailing])
                    }
                }
                if selection == 1{
                    ForEach(0..<models.count,id: \.self){index in
                        if models[index].feedBackModel.feedbackHandleStatus == 0{
                            FeedbackCardView(model: models[index])
                                .padding([.leading,.trailing])
                        }
                        
                    }
                }
                
                if selection == 2{
                    ForEach(0..<models.count,id: \.self){index in
                        if models[index].feedBackModel.feedbackHandleStatus == 1{
                            FeedbackCardView(model: models[index])
                                .padding([.leading,.trailing])
                        }
                        
                    }
                }
                
                if selection == 3{
                    ForEach(0..<models.count,id: \.self){index in
                        if models[index].feedBackModel.feedbackHandleStatus == 2{
                            FeedbackCardView(model: models[index])
                                .padding([.leading,.trailing])
                        }
                        
                    }
                }
                if isLoadingMore{
                    ProgressView()
                }
            }.onAppear{
                /**获取数据*/
                if !isLoadingMore{
                    isLoadingMore = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 模拟网络请求延迟
                        //loadMoreItems()
                        vieModel.GetList(status: 0){ viewModels in
                            for item in viewModels{
                                models.append(item)
                            }
                            isLoadingMore = false
                        }
                    }
                }
                
            }
            
            
            Spacer()
            
        }
        
    }
    
//    init(models: [FeedbackViewModel]) {
//        self.models = models
//    }
}

#Preview {
    //let models = TestData().FeedbackTestData()
    return FeedbackListView()
}
