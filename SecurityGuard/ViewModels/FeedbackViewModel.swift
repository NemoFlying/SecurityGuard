//
//  feebackViewModel.swift
//  SecurityGuard
//
//  Created by mac on 2024/9/5.
//

import Foundation


class FeedbackViewModel: NSObject,Codable{
    var feebackTitle:String=""  //反馈标题
    var feebackCategory:String = "" //反馈类别
    var feebackArea:String = ""
    var feebackLocation:[Double]=[] //反馈位置
    var feebackDetail:String = "" //反馈明细
    var feebackImage:[String]=[] //反馈图片
    var feebackHandleStatus:Int = 0 //处理状态 0 未处理，1处理中 2已完成
    
    func Verify() -> (Bool,String){
        if feebackTitle.isEmpty{
            return (false,"请输入反馈标题")
        }
        if feebackCategory.isEmpty{
            return (false,"请输入反馈类别")
        }
        if feebackLocation.isEmpty || feebackLocation[0] == 0{
            return (false,"请选择反馈位置")
        }

        return(true,"")
    }
}
