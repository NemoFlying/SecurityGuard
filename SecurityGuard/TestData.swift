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
        model.feebackTitle = "道路积水"
        model.feebackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过"
        model.feebackArea = "A1"
        model.feebackHandleStatus = 0
        model.feebackCategory = "xxxxxx"
        model.feebackLocation = [30.582595601035205,103.718863233145]
        model.feebackImage = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model)
        let model1 = FeedbackViewModel()
        model1.feebackTitle = "道路积水1"
        model1.feebackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过1"
        model1.feebackArea = "A2"
        model1.feebackHandleStatus = 1
        model1.feebackLocation = [30.582595601035205,103.718863233145]
        model1.feebackImage = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model1)
        
        let model2 = FeedbackViewModel()
        model2.feebackTitle = "道路积水2"
        model2.feebackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过1"
        model2.feebackArea = "A2"
        model2.feebackHandleStatus = 2
        model2.feebackLocation = [30.582595601035205,103.718863233145]
        model2.feebackImage = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model2)
        
        let model3 = FeedbackViewModel()
        model3.feebackTitle = "道路积水2"
        model3.feebackDetail = "厂区到宿舍那一段外围路，发现地下水冒出，地面积水严重，无法通过1"
        model3.feebackArea = "A2"
        model3.feebackHandleStatus = 0
        model3.feebackLocation = [30.582595601035205,103.718863233145]
        model3.feebackImage = ["https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2024%2F0830%2Fa17a6600j00sj0z7700tzd000o000t6p.jpg&thumbnail=660x2147483647&quality=80&type=jpg","https://img2.baidu.com/it/u=1921763336,1933386608&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=554"]
        models.append(model3)
        
        return models;
    }
}
