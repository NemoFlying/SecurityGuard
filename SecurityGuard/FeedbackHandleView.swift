//
//  feebackHandleView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import SwiftUI

struct FeedbackHandleView: View {
    var models:[FeedbackViewModel]   /**未处理的*/
    @State var selectModel:FeedbackViewModel?
    @State var isShowDetail:Bool = false
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                ForEach(0..<models.count,id: \.self){index in
                    let model = models[index]
                    if model.feedBackModel.feedbackHandleStatus == 0{
                        FeedbackCardView(model: model)
                            .padding([.leading,.trailing])
                            .onTapGesture{
                                self.selectModel = model
                                isShowDetail = true
                            }
                            .fullScreenCover(isPresented: $isShowDetail, content: {
                                FeedbackHandleDetailView(model: selectModel ?? models[0])
                            })
                    }
                    
                }
            }.onAppear{
                selectModel = models[0]
            }
        }
    }
}

#Preview {
    let models = TestData().FeedbackTestData()
    return FeedbackHandleView(models: models)
}
