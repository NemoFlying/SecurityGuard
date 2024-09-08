//
//  EquipmentInspectView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI

struct EquipmentInspectView: View {
    @ObservedObject var vmodel:InspectViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedSafeLevels = ["高","中","低"]
    @State var selectedSafeLevel:Int = 0

    var body: some View {
        VStack{
            Text("\(vmodel.model.inspectTitle)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            HStack{
                Text("巡检单号:\(vmodel.model.inspectId)")
                Spacer()
                Text("\(vmodel.model.inspectDeadLineDate)")
            }
        }
        .padding()
        .background(.green)
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
                    if(item.inspectItemType)==0{
                        HStack{
                            Text("\(item.inspectItemName)")
                            Spacer()
                            TextField("", text: $vmodel.model.items[index].inspectItemsStringValue)
                                .frame(width: 80)
                                .border(Color.black)
                        }
                        .font(.title2)
                        .onTapGesture {
                            hideKeybord()
                        }
                    }
                    else if(item.inspectItemType == 1){
                        SelectedView(
                            showTitle: "\(item.inspectItemName)",
                            selectedItems: $vmodel.model.items[index].inspectItemSelectValues,
                            selectedValue: $vmodel.model.items[index].inspectItemsIntValue
                        )
                        
//                        SelectedView(
//                            showTitle: "\(item.inspectItemName)",
//                            selectedItems: $selectedSafeLevels,
//                            selectedValue: $selectedSafeLevel
//                        )
                        
                    }
                    
                    
                }
//                SelectedView(
//                    showTitle: "zzzzzzz",
//                    selectedItems: $model.items[1].inspectItemSelectValues,
//                    selectedValue: $model.items[1].inspectItemsIntValue
//                )
            }
            
            HStack{
                Button(action: {
                    
                }, label: {
                    Text("问题上报")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(.red)
                        .cornerRadius(18)
                        
                })
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("完成巡检")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .background(.green)
                        .cornerRadius(18)
                        
                })
            }.padding()
        }
        .padding()
        
       // Spacer()
        
    }
}

#Preview {
    let model = TestData().InspectTestData()[2]
    return EquipmentInspectView(vmodel: model)
}
