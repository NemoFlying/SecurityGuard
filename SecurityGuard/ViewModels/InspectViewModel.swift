//
//  InspectViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/8.
//

import Foundation
class InspectViewModel: ObservableObject
{
    
//    var inspectId:Int = 0
//    var inspectTitle:String = ""
//    var inspectDesc:String = ""
//    var inspectDeadLineDate:String = ""
//    var isExpired:Bool = false //是否过期
//    var inspectType:Int = 0   // 0表示设备巡检 ，1表示巡场
//    var inspectStatus:Int = 0 //0:未开始，1表示结束
//    var items:[InspectDetailModel] = [] //巡检项目
    @Published var model:InspectModel
    init(model: InspectModel) {
        self.model = model
    }
}

//class InspectDetailModel:ObservableObject,Codable
//{
//    var inspectItemName:String = ""
//    var inspectItemType:Int = 0  //0表示文本输入，1表示选择
//    var inspectItemSelectValues:[String]=[]
//    var inspectItemsStringValue:String=""
//    @Published var inspectItemsIntValue:Int=0
//    
//    enum CodingKeys:CodingKey{
//        case inspectItemsIntValue
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        inspectItemsIntValue = try container.decode(Int.self, forKey: .inspectItemsIntValue)
//        super.init()
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(inspectItemsIntValue, forKey: .inspectItemsIntValue)
//    }
//    
//}
