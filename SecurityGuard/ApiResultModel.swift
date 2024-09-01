//
//  ApiResultModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/8/31.
//

import Foundation
class ApiResultModel<T: Codable>: Codable
{
    var isSucess:Bool = false
    
    var msg:String?
    
    var data:T? = nil
}

class TestModel: Codable
{
    var aa:String?
    var bb:String?
}
