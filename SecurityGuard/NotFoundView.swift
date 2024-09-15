//
//  NotFoundView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/15.
//

import SwiftUI

struct NotFoundView: View {
    var functionView:any View = InspectHomeView()
    var body: some View {
        Text("开发中")
//        if let functionView = functionView as? InspectHomeView{
//            functionView
//        }
        
    }
}

#Preview {
    NotFoundView()
}
