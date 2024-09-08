//
//  InspectHomeView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI

struct InspectHomeView: View {
    @State private var selection = 0
    var vmodels:[InspectViewModel]
    var backgoundColor:Color = Color(red: 0.0, green: 0.25, blue: 0.1)
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
        }
        
        
        
        
    }
}

#Preview {
    var models = TestData().InspectTestData()
    return InspectHomeView(vmodels: models)
}
