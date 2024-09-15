//
//  SideMenuModel.swift
//  SecurityStyle
//
//  Created by 熊何凡 on 2024/9/14.
//  侧边菜单显示的列表内容

import Foundation

enum SideMenuModel:Int,CaseIterable{
    
    case messages
   // case shop
    case order
    case repassword
    case logout
    
    var titlee:String{
        switch self{
        case .messages:return "我的消息"
        //case .shop:return "积分商城"
        case .order:return "我的订单"
        case .repassword:return "修改密码"
        case .logout:return "退出登陆"
        }
    }
    var imageName:String{
            switch self{
            case .messages:return "bell"
            //case .shop:return "bag.badge.plus"
            case .order:return "list.bullet.clipboard"
            case .repassword:return "lock.open.rotation"
            case .logout:return "arrow.left.square"
        }
    }
}
