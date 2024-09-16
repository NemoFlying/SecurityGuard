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
    @ObservedObject var viewModel = FeedbackViewModel()
    @State var selectModel:FeedbackViewModel?
    @State var isShowDetail:Bool = false
    private var backgoundColor:Color = Color(red: 76/255, green: 134/255, blue: 110/255)
    var body: some View {
        NavigationStack{
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
                                    .onTapGesture{
                                        self.selectModel = models[index]
                                        isShowDetail = true
                                    }
                                    .fullScreenCover(isPresented: $isShowDetail, content: {
                                        FeedbackResultView(viewModel: selectModel ?? models[0])
                                    })
                            }
                            
                        }
                    }
                    
                    if let selectModel = selectModel{
                        FeedbackResultView(viewModel: selectModel)
                            .hidden()
                    }
                }
                //Spacer()
                
            }
            .onAppear{
                /**获取数据*/
                if !isLoadingMore{
                    isLoadingMore = true
                    viewModel.GetList(status: 0){ viewModels in
                        for item in viewModels{
                            models.append(item)
                        }
                        isLoadingMore = false
                    }
                }
                
            }
            .alert(isPresented: $viewModel.showAlter){
                if viewModel.httpRequestStatus == 2{
                    Alert(title: Text(""),message: Text("\(viewModel.alterMsg)"))
                }else{
                    Alert(title: Text("Error"),message: Text("\(viewModel.alterMsg)"))
                }
            }
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
