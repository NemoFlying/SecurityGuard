//
//  FunctionViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/15.
//

import Foundation
import SwiftUI
class FunctionViewModel: ObservableObject
{
    var functionTitle:String = ""
    var functionImage:String = ""
    var functionRole:[String] = [] //为空都可以
    var functionView:String  = "NotFoundView"

    private var allFunctions:[FunctionViewModel]=[]
    
    func CreateFunctions(){
        let fun1 = FunctionViewModel()
        fun1.functionTitle = "我的巡检"
        fun1.functionImage = "doc.text.magnifyingglass"
        fun1.functionRole = ["巡检人员"]
        fun1.functionView = "InspectHomeView"
        allFunctions.append(fun1)
        let fun2 = FunctionViewModel()
        fun2.functionTitle = "巡检管理"
        fun2.functionImage = "person.2.badge.gearshape"
        fun2.functionRole = ["巡检人员"]
        allFunctions.append(fun2)
        let fun3 = FunctionViewModel()
        fun3.functionTitle = "反馈处理"
        fun3.functionImage = "pencil.and.outline"
        fun3.functionRole = ["超级管理员"]
        fun3.functionView = "FeedbackHandleView"
        allFunctions.append(fun3)
        let fun4 = FunctionViewModel()
        fun4.functionTitle = "员工反馈"
        fun4.functionImage = "exclamationmark.bubble"
        fun4.functionRole = []
        fun4.functionView = "FeedbackView"
        allFunctions.append(fun4)
        let fun5 = FunctionViewModel()
        fun5.functionTitle = "问题反馈"
        fun5.functionImage = "pencil.and.list.clipboard"
        fun5.functionRole = []
        allFunctions.append(fun5)
        let fun6 = FunctionViewModel()
        fun6.functionTitle = "我的反馈"
        fun6.functionImage = "book.pages"
        fun6.functionRole = []
        fun6.functionView = "FeedbackListView"
        allFunctions.append(fun6)
        let fun7 = FunctionViewModel()
        fun7.functionTitle = "积分商城"
        fun7.functionImage = "giftcard"
        fun7.functionRole = []
        allFunctions.append(fun7)
    }
    
    
    public func getRoleFunction(roleName:String) -> [FunctionViewModel]{
        if allFunctions.count==0{
            CreateFunctions()
        }
        if roleName == "超级管理员"{
            return allFunctions
        }
        var re:[FunctionViewModel] = []
        for item in allFunctions{
            if(item.functionRole.count==0 || item.functionRole.contains(roleName)){
                re.append(item)
            }
        }
        return re
    }
    
    func DynamicView() -> ChangedView {
        return ChangedView(viewName: functionView);
    }
    
    
}
