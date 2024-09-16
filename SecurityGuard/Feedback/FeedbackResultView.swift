//
//  FeedbackResultView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/16.
//

import SwiftUI

struct FeedbackResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel:FeedbackViewModel
    @State var selectedIsTrues = ["是","否"]  //为啥不能定义为 private
    @State var selectedIsTrue:Int = 0
    
    @State var selectedSafeLevels = ["高","中","低"]
    @State var selectedSafeLevel:Int = 0
    
    //@State var feedbackSolution:String=""
    @State var showMsg:Bool = false
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment: .leading) {
                    Text("反馈标题:")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.top])
                        .padding([.bottom],1)
                        .foregroundColor(Color(.systemGray))
                    Text("\(viewModel.feedBackModel.feedbackTitle)")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.bottom],4)
                        .underline(color: Color(.systemGray))
                        .padding([.bottom],5)
                        .bold()
                    
                    HStack{
                        Text("反馈类别:")
                            .font(.title3)
                            .foregroundColor(Color(.systemGray))
                        Text("\(viewModel.feedBackModel.feedbackCategory)")
                            .font(.title2)
                            .bold()
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding([.bottom],4)
                    .underline(color: Color(.systemGray))
                    .padding([.bottom],5)
                    
                    HStack{
                        Text("问题位置:")
                            .font(.title3)
                            .foregroundColor(Color(.systemGray))
                        Text("\(viewModel.feedBackModel.feedbackArea)")
                            .font(.title2)
                            .bold()
                        FeedbackMapView(
                            mapLocation: .init(
                                latitude: viewModel.feedBackModel.feedbackLocations[0],
                                longitude: viewModel.feedBackModel.feedbackLocations[1]
                            )
                        )
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding([.bottom],4)
                    .underline(color: Color(.systemGray))
                    .padding([.bottom],5)
                    
                    Text("详细地址:")
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.bottom],1)
                        .foregroundColor(Color(.systemGray))
                    Text("\(viewModel.feedBackModel.feedbackAreaDetail)")
                        .font(.title2)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding([.bottom],4)
                        .underline(color: Color(.systemGray))
                        .padding([.bottom],5)
                        .bold()
                    
                    
                    VStack{
                        Text("详细说明:")
                            .font(.title3)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding([.bottom],1)
                            .foregroundColor(Color(.systemGray))
                        Text("\(viewModel.feedBackModel.feedbackDetail)")
                        //.lineLimit(3)
                            .padding(.all,10)
                            .font(.title3)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .bold()
                            .background(Color(.systemGray3))
                    }
                    VStack
                    {
                        FeedbackImageShowView(feebackImageUrl: viewModel.feedBackModel.feedbackImages)
                    }
                    HStack{
                        Text("情况是否属实:")
                            .font(.title3)
                            .foregroundColor(Color(.systemGray))
                        Text("\(viewModel.feedBackModel.feedbackIsTrue==0 ? "是":"否")")
                            .font(.title2)
                            .bold()
                    }.frame(maxWidth:.infinity,alignment: .leading)
                        .padding([.bottom],4)
                        .underline(color: Color(.systemGray))
                        .padding([.bottom],5)
                    
                    HStack{
                        Text("问题风险等级:")
                            .font(.title3)
                            .foregroundColor(Color(.systemGray))
                        Text("\(viewModel.feedBackModel.feedbackSafeLevel)")
                            .font(.title2)
                            .bold()
                    }.frame(maxWidth:.infinity,alignment: .leading)
                        .padding([.bottom],4)
                        .underline(color: Color(.systemGray))
                        .padding([.bottom],5)
//                    HStack{
//                        Text("问题风险等级:")
//                            .font(.title3)
//                            .foregroundColor(Color(.systemGray))
//                        Text("\(viewModel.feedBackModel.feedbackSafeLevel==0 ? "高":"否")")
//                            .font(.title2)
//                            .bold()
//                    }
                    //
                    
                }
                    .navigationTitle(Text("问题处理"))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing: closeBtn)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding([.leading,.trailing,.bottom])
                    .background(Color(.systemGray6))
                    .padding(.bottom,10)
                
                VStack{
                    SelectedView(
                        showTitle: "情况是否属实",
                        selectedItems: $selectedIsTrues,
                        selectedValue: $selectedIsTrue
                    )
                    SelectedView(
                        showTitle: "问题风险等级",
                        selectedItems: $selectedSafeLevels,
                        selectedValue: $selectedSafeLevel
                    )
                    VStack(alignment: .leading)
                    {
                        Text("解决方案").font(.title2)
                        ZStack(alignment: .leading){
                            TextEditor(text: $viewModel.feedBackModel.feedbackSolution)
                                .padding()
                            if viewModel.feedBackModel.feedbackSolution.isEmpty{
                                Text("详细说明情况")
                                    .foregroundColor(Color(.systemGray2))
                                    .padding(25)
                            }
                        }.overlay{
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor.placeholderText),lineWidth: 1)
                                //.background(Color(.black))
                                .opacity(0.2)
                        }.padding(1)
                            .frame(height: 150)
                    }.onTapGesture {
                        hideKeybord()
                    }
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding([.leading,.trailing,.bottom])
                
                Spacer()
            }
        }
        .alert(isPresented: $viewModel.showAlter){
            if viewModel.httpRequestStatus == 2{
                Alert(title: Text("保存成功"),message: Text(""))
            }else{
                Alert(title: Text("保存失败"),message: Text("\(viewModel.alterMsg)"))
            }
        }
    }
    
    
    
    private var closeBtn:some View{
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack{
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color(.systemGray3))
            }
            
        }
    }
    
}

#Preview {
    let model = TestData().FeedbackTestData()[0]
    return FeedbackResultView(viewModel: model)
}
