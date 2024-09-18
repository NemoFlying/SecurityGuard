//
//  InspectResultView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/17.
//

import SwiftUI

struct InspectResultView: View {
    @ObservedObject var vmodel:InspectViewModel
    @Environment(\.presentationMode) var presentationMode
    let baseColor = Color(red: 76/255, green: 134/255, blue: 110/255)
    var body: some View {
        VStack{
            ZStack(alignment:.topLeading){
                Text("\(vmodel.model.inspectTitle)")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .frame(maxWidth: .infinity)
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .onTapGesture {
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            HStack{
                Text("巡检单号:\(vmodel.model.inspectId)")
                Spacer()
                Text("\(vmodel.model.inspectDeadLineDate)")
            }
        }
        .padding()
        .background(baseColor)
        .foregroundColor(.white)
        .bold()
        
        VStack{
            HStack{
                Text("巡检内容")
                Spacer()
                Text("结果")
            }.font(.title2)
                .bold()
                .padding([.bottom])
                .underline(color: Color(.systemGray2),height:3)
            
            ScrollView(.vertical,showsIndicators: false){
                ForEach(0..<vmodel.model.items.count,id:\.self){ index in
                    let item = vmodel.model.items[index]
                    HStack{
                        Text("\(item.inspectItemName)")
                        Spacer()
                        Text("\(item.inspectItemStringValue)")
                            .frame(width: 80)
                    }
                    .font(.title2)
                }
                
                VStack(alignment: .leading)
                {
                    Text("其它问题记录").font(.title2)
                    ZStack(alignment: .leading){
                        TextEditor(text: $vmodel.model.inspectOtherQuestions)
                            .padding()
                        if vmodel.model.inspectOtherQuestions.isEmpty{
                            Text("请输入内容")
                                .foregroundColor(Color(UIColor.placeholderText))
                                .padding(25)
                        }
                    }.overlay{
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(UIColor.placeholderText),lineWidth: 1)
                    }.padding(1)
                        .frame(height: 150)
                }.padding([.top],1)
                .onTapGesture {
                    hideKeybord()
                }
                
//                if let cameraPosition = cameraPosition{
//                    MapView(cameraPosition: cameraPosition, newCoordinate2D: $locationManager.lastLocation)
//                        .frame(height: 200)
//                }
//
            }
            .padding()
            
            // Spacer()
            
        }
        
        
        
        
    }
}

#Preview {
    let model = TestData().InspectTestData()[2]
    return InspectResultView(vmodel: model)
}
