//
//  SelectedView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import SwiftUI

struct SelectedView: View {
    var showTitle:String
    @Binding var selectedItems:[String]
    @Binding var selectedValue:Int
    
    
    var body: some View {
        HStack{
            Text("\(showTitle)").font(.title2)
            Image(systemName: "star.fill")
                .foregroundColor(.red)
                .font(.system(size:10))
            Spacer()
            Picker("\(showTitle)", selection: $selectedValue){
                ForEach(0 ..< selectedItems.count, id:\.self){
                    Text(selectedItems[$0])
                }
                
            }.pickerStyle(.menu)
                .font(.title2)
                .onTapGesture {
                    hideKeybord()
                }
        }
    }
}

//#Preview {
//    SelectedView()
//}
