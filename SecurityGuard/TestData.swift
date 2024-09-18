//
//  FeedbackListTestData.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/7.
//

import Foundation

class TestData:NSObject{
    
    func FeedbackTestData() -> [FeedbackViewModel]{
        var models:[FeedbackViewModel] = []
        let model = FeedbackViewModel()
        model.feedBackModel.feedbackTitle = "道路积水"
        model.feedBackModel.feedbackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过"
        model.feedBackModel.feedbackArea = "A1"
        model.feedBackModel.feedbackHandleStatus = 0
        model.feedBackModel.feedbackCategory = "xxxxxx"
        model.feedBackModel.feedbackLocations = [30.582595601035205,103.718863233145]
        model.feedBackModel.feedbackImages = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model)
        let model1 = FeedbackViewModel()
        model1.feedBackModel.feedbackTitle = "道路积水1"
        model1.feedBackModel.feedbackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过1"
        model1.feedBackModel.feedbackArea = "A2"
        model1.feedBackModel.feedbackHandleStatus = 1
        model1.feedBackModel.feedbackLocations = [30.582595601035205,103.718863233145]
        model1.feedBackModel.feedbackImages = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model1)
        
        let model2 = FeedbackViewModel()
        model2.feedBackModel.feedbackTitle = "道路积水2"
        model2.feedBackModel.feedbackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过1"
        model2.feedBackModel.feedbackArea = "A2"
        model2.feedBackModel.feedbackHandleStatus = 2
        model2.feedBackModel.feedbackLocations = [30.582595601035205,103.718863233145]
        model2.feedBackModel.feedbackImages = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model2)
        
        let model3 = FeedbackViewModel()
        model3.feedBackModel.feedbackTitle = "道路积水2"
        model3.feedBackModel.feedbackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过1"
        model3.feedBackModel.feedbackArea = "A2"
        model3.feedBackModel.feedbackHandleStatus = 0
        model3.feedBackModel.feedbackLocations = [30.582595601035205,103.718863233145]
        model3.feedBackModel.feedbackImages = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model3)
        
        return models;
    }
    
    func InspectTestData() -> [InspectViewModel]{
        var re:[InspectViewModel] = []
        let re1 = InspectViewModel()
        re1.model.inspectId = 1
        re1.model.inspectTitle = "厂区巡检-A区"
        re1.model.inspectDeadLineDate="2024-7-24"
        re1.model.inspectDesc = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        re1.model.isExpired = false
        re1.model.inspectType = 1
        re1.model.inspectStatus = 1
        //let reViewModel = InspectViewModel(model: re1)
        re.append(re1)
        
        let re2 = InspectViewModel()
        re2.model.inspectId = 2
        re2.model.inspectTitle = "厂区巡检-B区"
        re2.model.inspectDeadLineDate="2024-7-24"
        re2.model.inspectDesc = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        re2.model.isExpired = false
        re2.model.inspectType = 1
        re2.model.inspectStatus = 0
        
        //let reViewModel2 = InspectViewModel(model: re2)
        re.append(re2)
        
        let re3 = InspectViewModel()
        re3.model.inspectId = 3
        re3.model.inspectTitle = "变压器巡检"
        re3.model.inspectDeadLineDate="2024-7-24"
        re3.model.inspectDesc = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        re3.model.isExpired = false
        re3.model.inspectType = 0
        re3.model.inspectStatus = 0
        re3.model.inspectLocations = [30.582595601035205,103.718863233145]
        
        let rr3:InspectItemModel = InspectItemModel()
        rr3.inspectItemName = "电源指示是否正常"
        rr3.inspectItemType = 1
        rr3.inspectItemSelectValues=["是","否"]
        re3.model.items.append(rr3)
        
        let rr31:InspectItemModel = InspectItemModel()
        rr31.inspectItemName = "三相负载是否平衡"
        rr31.inspectItemType = 1
        rr31.inspectItemSelectValues=["是","否"]
        re3.model.items.append(rr31)
        
        let rr32:InspectItemModel = InspectItemModel()
        rr32.inspectItemName = "当前电压数值"
        rr32.inspectItemType = 0
        re3.model.items.append(rr32)
        //let reViewModel3 = InspectViewModel(model: re3)
        re.append(re3)
        return re
    }
}
