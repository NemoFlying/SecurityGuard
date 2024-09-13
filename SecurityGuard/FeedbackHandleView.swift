//
//  feebackHandleView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI

struct FeedbackHandleView: View {
    @State private var models:[FeedbackViewModel] = []   /**未处理的*/
    var vieModel = FeedbackViewModel()
    @State var selectModel:FeedbackViewModel?
    @State var isShowDetail:Bool = false
    @State private var isLoadingMore = false
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                ForEach(0..<models.count,id: \.self){index in
                    let currentId = index
                    let model = models[currentId]
                    if model.feedBackModel.feedbackHandleStatus == 0{
                        FeedbackCardView(model: model)
                            .padding([.leading,.trailing])
                            .onTapGesture{
                                self.selectModel = model
                                isShowDetail = true
                            }
                            .fullScreenCover(isPresented: $isShowDetail, content: {
                                FeedbackHandleDetailView(viewModel: selectModel ?? models[0])
                            })
                    }
                    
                }
                if isLoadingMore{
                    ProgressView()
                }
            }.onAppear{
                //selectModel = models[0]
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
        }
    }
}

#Preview {
    //let models = TestData().FeedbackTestData()
    return FeedbackHandleView()
}
