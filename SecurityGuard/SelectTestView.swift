//
//  SelectTestView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI

struct SelectTestView: View {
//    @State var selectItems:[String] = ["A","B"]
//    @State var selectValue:Int = 0
    @ObservedObject var model:SelectModel
    var body: some View {
        SelectedView(
            showTitle: "XXXXXXXXXX",
            //            selectedItems: $selectItems,
            //            selectedValue: $selectValue
            selectedItems: $model.selectItems,
            selectedValue: $model.selectValue
        )
    }
}

#Preview {
    var model = SelectModel()
   return SelectTestView(model: model)
}

class SelectModel2:NSObject{
    var item:[SelectModel]=[]
}

class SelectModel:ObservableObject{
    var selectItems = ["A","B","V"]
    @Published var selectValue:Int = 0
}
