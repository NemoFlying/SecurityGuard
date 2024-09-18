//
//  ChangedView.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/15.
//

import SwiftUI

struct ChangedView: View {
    var viewName:String
    var body: some View {
        //InspectHomeView
        //FeedbackHandleView
        //FeedbackView
        //FeedbackListView
        switch viewName{
        case "FeedbackView":
            FeedbackView()
        case "FeedbackListView":
            FeedbackListView()
        case "FeedbackHandleView":
            FeedbackHandleView()
        case "InspectHomeView":
            InspectHomeView()
        case "ContentView":
            ContentView()
        default:
            NotFoundView()
        }
    }
}

//#Preview {
//    ChangedView()
//}
