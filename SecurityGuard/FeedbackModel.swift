//
//  FeedbackModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/9.
//

import Foundation
class FeedbackModel:NSObject,Codable{
    var feedbackId:Int = 0
    var feedbackTitle:String=""  //反馈标题
    var feedbackCategory:String = "" //反馈类别
    var feedbackArea:String = ""
    var feedbackLocations:[Double]=[] //反馈位置
    var feedbackDetail:String = "" //反馈明细
    var feedbackImages:[String]=[] //反馈图片
    var feedbackHandleStatus:Int = 0 //处理状态 0 未处理，1处理中 2已完成
    
    func toDictionary() -> [String: Any] {
        return [
            "feedbackId": feedbackId,
            "feedbackTitle": feedbackTitle,
            "feedbackCategory": feedbackCategory,
            "feedbackArea":feedbackArea,
            "feedbackImages":feedbackImages,
            "feedbackLocations":feedbackLocations,
            "feedbackDetail":feedbackDetail,
            "feedbackHandleStatus":feedbackHandleStatus
        ]
    }
}
class FeedbackModel2:NSObject,Codable{
    var feedbackId:Int = 0

}
