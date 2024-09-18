//
//  InspectModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import Foundation
class InspectModel: NSObject,Codable
{
    var inspectId:Int = 0
    var inspectTitle:String = ""
    var inspectDesc:String = ""
    var inspectDeadLineDate:String = ""
    var isExpired:Bool = false //是否过期
    var inspectType:Int = 0   // 0表示设备巡检 ，1表示巡场
    var inspectStatus:Int = 0 //0:未开始，1表示结束
    var inspectLocations:[Double] = []
    var inspectArea:String = ""
    var items:[InspectItemModel] = [] //巡检项目
    var inspectClockLocations:[Double] = []
    var inspectOtherQuestions:String = ""
    
    func toDictionary() -> [String: Any] {
        var reBackitems:[[String:Any]] = [[:]]
        for item in self.items{
            reBackitems.append(item.toDictionary())
        }
        return [
            "inspectId": inspectId,
            "inspectTitle": inspectTitle,
            "inspectDesc": inspectDesc,
            "inspectDeadLineDate":inspectDeadLineDate,
            "isExpired":isExpired,
            "inspectType":inspectType,
            "inspectStatus":inspectStatus,
            "items":reBackitems,
            "inspectClockLocations":inspectClockLocations,
            "inspectOtherQuestions":inspectOtherQuestions
        ]
    }
}

class InspectItemModel:NSObject,Codable
{
    var inspectItemId:Int = 0
    var inspectId:Int = 0
    var inspectItemName:String = ""
    var inspectItemType:Int = 0  //0表示文本输入，1表示选择
    var inspectItemSelectValues:[String]=[]
    var inspectItemStringValue:String=""
    var inspectItemIntValue:Int=0
    func toDictionary() -> [String: Any] {
        return [
            "inspectItemId":inspectItemId,
            "inspectId":inspectId,
            "inspectItemName":inspectItemName,
            "inspectItemType":inspectItemType,
            "inspectItemSelectValues":inspectItemSelectValues,
            "inspectItemStringValue":inspectItemStringValue,
            "inspectItemIntValue":inspectItemIntValue,
        ]
    }
}
