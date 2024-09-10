//
//  FeedbackHandleDetailView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/7.
//

import SwiftUI

struct FeedbackHandleDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var model:FeedbackViewModel
    @State var selectedIsTrues = ["是","否"]  //为啥不能定义为 private
    @State var selectedIsTrue:Int = 0
    
    @State var selectedSafeLevels = ["高","中","低"]
    @State var selectedSafeLevel:Int = 0
    
    @State var feedbackSolution:String=""
    
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
                    Text("\(model.feedBackModel.feedbackTitle)")
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
                        Text("\(model.feedBackModel.feedbackCategory)")
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
                        Text("\(model.feedBackModel.feedbackArea)")
                            .font(.title2)
                            .bold()
                        FeedbackMapView(
                            mapLocation: .init(
                                latitude: model.feedBackModel.feedbackLocations[0],
                                longitude: model.feedBackModel.feedbackLocations[1]
                            )
                        )
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding([.bottom],4)
                    .underline(color: Color(.systemGray))
                    .padding([.bottom],5)
                    
                    VStack{
                        Text("详细说明:")
                            .font(.title3)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .padding([.bottom],1)
                            .foregroundColor(Color(.systemGray))
                        Text("\(model.feedBackModel.feedbackDetail)")
                        //.lineLimit(3)
                            .padding(.all,10)
                            .font(.title3)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .bold()
                            .background(Color(.systemGray3))
                    }
                    VStack
                    {
                        FeedbackImageShowView(feebackImageUrl: model.feedBackModel.feedbackImages)
                    }
                    
                    //
                    
                }.navigationTitle(Text("问题处理"))
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: closeBtn,trailing: saveBtn)
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
                    //Text("解决方案").font(.title2)
                    //TextField("控制在15个字内",text: $feedbackSolution)
                    //TextField(text: $feedbackSolution)
                    VStack(alignment: .leading)
                    {
                        Text("解决方案").font(.title2)
                        ZStack(alignment: .leading){
                            TextEditor(text: $feedbackSolution)
                                .padding()
                            if feedbackSolution.isEmpty{
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
    }
    
    
    
    
//    struct SelectedView:View {
//        var showTitle:String
//        var selectedItems:[String]
//        @Binding var selectedValue:Int
//        
//        
//        var body: some View {
//            HStack{
//                Text("\(showTitle)").font(.title2)
//                Image(systemName: "star.fill")
//                    .foregroundColor(.red)
//                    .font(.system(size:10))
//                Spacer()
//                Picker("\(showTitle)", selection: $selectedValue){
//                    ForEach(0 ..< selectedItems.count, id:\.self){
//                        Text(self.selectedItems[$0])
//                    }
//                }.pickerStyle(.menu)
//                    .font(.title2)
//                    .onTapGesture {
//                        hideKeybord()
//                    }
//            }
//        }
//    }
    
    
    
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
    private var saveBtn:some View{
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("保存")
        })
    }
    
    
}

#Preview {
    let model = TestData().FeedbackTestData()[0]
    return FeedbackHandleDetailView(model: model)
}
