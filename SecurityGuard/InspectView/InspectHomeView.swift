//
//  InspectHomeView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI

struct InspectHomeView: View {
    @State private var selection = 0
    @State var  vmodels:[InspectViewModel]=[]
    var vmodel:InspectViewModel = InspectViewModel()
    var backgoundColor:Color = Color(red: 0.0, green: 0.25, blue: 0.1)
    @State private var isLoadingMore = false
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
                    Text("待巡检")
                        .underline(color: (selection == 1 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 1
                        }
                }
                Spacer()
                VStack{
                    Text("已完成").underline(color: (selection == 2 ? .white:backgoundColor), height: 5,offset: -9)
                        .onTapGesture {
                            selection = 2
                        }
                }
            }
            .foregroundColor(.white)
            .font(.title2)
            .padding()
            .background(backgoundColor)
        }
        ScrollView(.vertical,showsIndicators: false){
            if selection == 0{
                ForEach(0..<vmodels.count,id: \.self){index in
                    InspectCardView(vmodel: vmodels[index])
                        .padding([.leading,.trailing])
                }
            }
            if selection == 1{
                ForEach(0..<vmodels.count,id: \.self){index in
                    if(vmodels[index].model.inspectStatus == 0){
                        InspectCardView(vmodel: vmodels[index])
                            .padding([.leading,.trailing])
                    }
                }
            }
            if selection == 2{
                ForEach(0..<vmodels.count,id: \.self){index in
                    if(vmodels[index].model.inspectStatus == 1){
                        InspectCardView(vmodel: vmodels[index])
                            .padding([.leading,.trailing])
                    }
                }
            }
        }.onAppear{
            /**获取数据*/
            if !isLoadingMore{
                isLoadingMore = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // 模拟网络请求延迟
                    //loadMoreItems()
                    vmodel.GetList(status: 0){ viewModels in
                        for item in viewModels{
                            vmodels.append(item)
                        }
                        isLoadingMore = false
                    }
                }
            }
            
        }
        
        
        
        
    }
}

#Preview {
    //let models = TestData().InspectTestData()
    return InspectHomeView()
}
