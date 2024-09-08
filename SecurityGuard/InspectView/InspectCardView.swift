//
//  InspectCardView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI

struct InspectCardView: View {
    var vmodel:InspectViewModel
    var backgoundColor:Color = Color(red: 0.0, green: 0.25, blue: 0.1)
    @State var showDetail:Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            HStack{
                Text("\(vmodel.model.inspectTitle)")
                    .font(.title2)
                    .bold()
                Spacer()
                Text("\(vmodel.model.inspectDeadLineDate)")
            }
            Text("巡检内容描述")
            Text("\(vmodel.model.inspectDesc)")
            HStack{
                Spacer()
                
                if(vmodel.model.inspectStatus == 0){
                    Button(action: {
                        self.showDetail.toggle()
                    }, label: {
                        Text("开始")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .padding([.leading,.trailing],30)
                            .padding([.top,.bottom],10)
                            .background(backgoundColor)
                            .cornerRadius(16)
                    })
                }
            }
        }
        .padding()
        .background(LinearGradient(colors: [.green,.yellow], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(18)
        .fullScreenCover(isPresented: $showDetail, content: {
            if(vmodel.model.inspectType == 0){
                EquipmentInspectView(vmodel: vmodel)
            }
        })
    }
}

#Preview {
    let model = TestData().InspectTestData()[2]
    return InspectCardView(vmodel: model)
}
